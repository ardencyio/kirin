// external crates
use async_trait::async_trait;
use chrono::Utc;
use color_eyre::Result;
use uuid::Uuid;

// module dependencies
use crate::errors::GetPersonError;
use crate::types::person::Person;

// Your repository trait
#[cfg_attr(test, mockall::automock)]
#[async_trait]
pub trait Repository {
    async fn get_person(&self, id: Uuid) -> Result<Person, GetPersonError>;
}

pub struct PersonRepository {}

#[async_trait]
impl Repository for PersonRepository {
    async fn get_person(&self, id: Uuid) -> Result<Person, GetPersonError> {
        Ok(Person {
            id,
            firstname: String::from("john"),
            lastname: String::from("appleseed"),
            email: String::from("john@example.com"),
            created: Utc::now(),
            updated: Utc::now(),
        })
    }
}

#[cfg(test)]
mod test {
    // repository tests go here
}
