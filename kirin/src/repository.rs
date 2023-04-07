// external crates
use async_trait::async_trait;
use color_eyre::Result;
use edgedb_protocol::value::Value;
use edgedb_tokio::create_client;
use edgedb_tokio::Client;
use uuid::Uuid;

// module dependencies
use crate::errors::AppError;
use crate::types::person::{NewPerson, Person};

// Your repository trait
#[cfg_attr(test, mockall::automock)]
#[async_trait]
pub trait Repository {
    async fn register(&self, person: NewPerson) -> Result<Vec<Uuid>, AppError>;
    async fn get_person(&self, id: Uuid) -> Result<Person, AppError>;
}

pub async fn get_client() -> Result<Client, edgedb_tokio::Error> {
    let pool = create_client().await;
    pool
}

pub struct PersonRepository {
    pool: Client,
}

#[async_trait]
impl Repository for PersonRepository {
    async fn register(&self, person: NewPerson) -> Result<Vec<Uuid>, AppError> {
        let query = r#"
            with data := <json>$data
            insert Person {
                firstname := <str>data['firstname'],
                lastname :=  <str>data['lastname'],
                nickname := <str>data['nickname'],
                login := <str>data['email'],
                status :=  <Status>data['status'],
                identity := (insert Identity {
                    email := <str>data['email'],
                    password := <str>data['login'],
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

    async fn get_person(&self, id: Uuid) -> Result<Person, AppError> {
        let query = r#"
            select Person {
              id,
              firstname,
              lastname,
              status,
              created,
              updated,
            }
            filter .id = <uuid>$id
        "#;

        let p = self.pool.query_single::<Value, _>(query, &(id,)).await?;
        Ok(p)
    }
}

#[cfg(test)]
mod test {
    // repository tests go here
}
