// exrternal crates
use color_eyre::Result;
use uuid::Uuid;

// module dependencies
use crate::errors::AppError;
use crate::repository::Repository;
use crate::types::person::{NewPerson, Person};
use crate::types::QueryResult;

// Your use case
pub struct GetPersonService<T: Repository> {
    repository: T,
}

impl<T: Repository> GetPersonService<T> {
    pub fn new(repository: T) -> Self {
        Self { repository }
    }

    pub async fn get_person(&self, id: Uuid) -> Result<Person, AppError> {
        self.repository.get_person(id).await
    }

    pub async fn register(&self, person: NewPerson) -> Result<Vec<QueryResult>, AppError> {
        self.repository.register(person).await
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
    use crate::types::Status;

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
            status: Status::PENDING,
        }
    }

    #[fixture]
    fn newperson() -> NewPerson {
        NewPerson {
            firstname: "testy".to_owned(),
            lastname: "testy".to_owned(),
            nickname: "testy".to_owned(),
            status: Status::PENDING,
            email: "test@example.com".to_owned(),
            login: "testid".to_owned(),
            password: "testhashpassword230434iru4o3iu345454n4340986Ur4iuy5".to_owned(),
            preferred: true,
            provider: "ardency".to_owned(),
        }
    }

    #[rstest]
    #[tokio::test]
    // #[ignore]
    async fn test_get_person(person: Person) -> Result<()> {
        let cp = person.clone();
        let mut mock = MockRepository::new();
        mock.expect_get_person()
            .with(eq(person.id))
            .times(1)
            .returning(move |_| Ok(cp.clone()));

        let srvc = GetPersonService::new(mock);

        let result = srvc.get_person(person.id).await?;

        assert_eq!(result, person);
        Ok(())
    }

    #[rstest]
    #[case(person(id()), Ok(person.clone()))]
    #[case(person(id()), Err(AppError::PersonNotFound))]
    #[tokio::test]
    async fn test_get_person_again(
        #[case] person: Person,
        #[case] expected: Result<Person, AppError>,
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
        let result = srvc.get_person(person.id).await;
        println!("[expected]: {:#?} | [result]: {:#?}", expected, result);

        assert_eq!(result.unwrap(), expected.unwrap());
        Ok(())
    }

    #[rstest]
    // #[case(newperson(), Ok(Vec<person.id()>))]
    #[case(newperson(), Err(AppError::UnknownError))]
    #[tokio::test]
    async fn test_register(
        #[case] newperson: NewPerson,
        #[case] expected: Result<Vec<Uuid>, AppError>,
    ) -> Result<()> {
        let er = expected.clone();
        // Create a mock repository and set expectations
        let mut mock = MockRepository::new();
        mock.expect_register()
            .with(eq(newperson.clone()))
            .times(1)
            .returning(move |_| match er.clone() {
                Ok(p) => Ok(p),
                Err(e) => Err(e),
            });

        // Create a use case with the mock repository
        let srvc = GetPersonService::new(mock);

        // Call the use case and check the result
        let result = srvc.register(newperson).await;
        println!("[expected]: {:#?} | [result]: {:#?}", expected, result);

        assert_eq!(result.unwrap(), expected.unwrap());
        Ok(())
    }
}
