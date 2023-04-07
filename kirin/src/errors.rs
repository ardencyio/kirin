use edgedb_tokio::Error as EdgedbError;
use serde_json::Error as SerdeJsonError;
use std::sync::Arc;
use thiserror::Error;

#[derive(Error, Debug, Clone)]
pub enum AppError {
    #[error("person not found")]
    PersonNotFound,
    #[error("{0}")]
    JsonParseError(#[from] Arc<SerdeJsonError>),
    #[error("{0}")]
    DatabaseError(#[from] Arc<EdgedbError>),
    #[error("something's wrong")]
    UnknownError,
}

impl From<SerdeJsonError> for AppError {
    fn from(err: SerdeJsonError) -> Self {
        AppError::JsonParseError(Arc::new(err))
    }
}

impl From<EdgedbError> for AppError {
    fn from(err: EdgedbError) -> Self {
        AppError::DatabaseError(Arc::new(err))
    }
}
