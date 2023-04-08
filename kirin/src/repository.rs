// external crates
use async_trait::async_trait;
use color_eyre::Result;
use edgedb_tokio::create_client;
use edgedb_tokio::Client;
use uuid::Uuid;

// module dependencies
use crate::errors::AppError;
use crate::types::person::{NewPerson, Person};
use crate::types::QueryResult;

// Your repository trait
#[cfg_attr(test, mockall::automock)]
#[async_trait]
pub trait Repository {
    async fn register(&self, person: NewPerson) -> Result<Vec<QueryResult>, AppError>;
    async fn get_person(&self, id: Uuid) -> Result<Person, AppError>;
}

pub async fn get_client() -> Result<Client, edgedb_tokio::Error> {
    let pool = create_client().await;
    pool
}

pub struct PersonRepository {
    pool: Client,
}

impl PersonRepository {
    pub async fn new(pool: Client) -> Self {
        Self { pool }
    }
}

#[async_trait]
impl Repository for PersonRepository {
    async fn register(&self, person: NewPerson) -> Result<Vec<QueryResult>, AppError> {
        let query = r#"
        with data := <json>$0
        insert Person {
          firstname := <str>data['firstname'],
          lastname :=  <str>data['lastname'],
          nickname := <str>data['nickname'],
          status :=  <Status>data['status'],
          identity := (insert Identity {
            email := <str>data['email'],
            login := <str>data['login'],
            password := <str>data['password'],
            preferred := <bool>data['preferred'],
            provider := (select (
              insert Provider { name := <optional str>data['provider'] }
              unless conflict on .name 
              else 
                (select Provider filter .name = <optional str>data['provider'] Limit 1)
            ))
          })
        }
        "#;

        let data = serde_json::to_string(&person)?;
        let id = self.pool.query(query, &(data,)).await?;
        Ok(id)
    }

    async fn get_person(&self, _id: Uuid) -> Result<Person, AppError> {
        unimplemented!()
        // let query = r#"
        //     select Person {
        //       id,
        //       firstname,
        //       lastname,
        //       status,
        //       created,
        //       updated,
        //     }
        //     filter .id = <uuid>$id
        // "#;

        // let p = self.pool.query_single::<Value, _>(query, &(id,)).await?;
        // Ok(p)
    }
}

#[cfg(test)]
mod test {
    // repository tests go here
}
