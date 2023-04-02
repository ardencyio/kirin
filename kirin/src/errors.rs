use thiserror::Error;

#[derive(Error, Debug, Clone, Copy)]
pub enum GetPersonError {
    #[error("person not found")]
    PersonNotFound,
    #[error("failed to get hero")]
    GetPersonError,
}
