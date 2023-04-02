// exrternal crates
use color_eyre::Result;
use uuid::Uuid;

// module dependencies
use crate::errors::GetPersonError;
use crate::repository::Repository;
use crate::types::person::Person;

// Your use case
pub struct GetPersonService<T: Repository> {
    repository: T,
}

impl<T: Repository> GetPersonService<T> {
    pub fn new(repository: T) -> Self {
        Self { repository }
    }

    pub async fn execute(&self, id: Uuid) -> Result<Person, GetPersonError> {
        self.repository.get_person(id).await
        // match self.repository.get_person(id).await {
        //     Ok(p) => Ok(p),
        //     Err(_) => Err(GetPersonError::PersonNotFound),
        // }
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use chrono::Utc;
    use color_eyre::Result;

    // external crates
    use mockall::predicate::*;
    use rstest::{fixture, rstest};

    // module deps
    use crate::repository::MockRepository;

    #[fixture]
    fn id() -> Uuid {
        Uuid::new_v4()
    }

    #[fixture]
    fn person(id: Uuid) -> Person {
        Person {
            updated: Utc::now(),
            created: Utc::now(),
            id,
            firstname: String::from("clark"),
            lastname: String::from("kent"),
            email: String::from("superman@example.com"),
        }
    }

    #[rstest]
    #[tokio::test]
    #[ignore]
    async fn test_get_person(person: Person) -> Result<()> {
        let cp = person.clone();
        let mut mock = MockRepository::new();
        mock.expect_get_person()
            .with(eq(person.id))
            .times(1)
            .returning(move |_| Ok(cp.clone()));

        let srvc = GetPersonService::new(mock);

        let result = srvc.execute(person.id).await?;

        assert_eq!(result, person);
        Ok(())
    }

    #[rstest]
    // #[case(person(id()), Ok(person.clone()))]
    #[case(person(id()), Err(GetPersonError::PersonNotFound))]
    #[tokio::test]
    async fn test_get_person_again(
        #[case] person: Person,
        #[case] expected: Result<Person, GetPersonError>,
    ) -> Result<()> {
        let er = expected.clone();
        // Create a mock repository and set expectations
        let mut mock = MockRepository::new();
        mock.expect_get_person()
            .with(eq(person.id))
            .times(1)
            .returning(move |_| match er.clone() {
                Ok(p) => Ok(p),
                Err(e) => Err(e),
            });

        // Create a use case with the mock repository
        let srvc = GetPersonService::new(mock);

        // Call the use case and check the result
        let result = srvc.execute(person.id).await?;
        println!("[expected]: {:#?} | [result]: {:#?}", expected, result);

        assert_eq!(result, expected.unwrap());
        Ok(())
    }
}
