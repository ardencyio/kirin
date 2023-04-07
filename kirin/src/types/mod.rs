use serde::{Deserialize, Serialize};
use uuid::Uuid;

pub mod identity;
pub mod person;

#[derive(Default, Debug, Clone, PartialEq, Serialize, Deserialize)]
pub enum Status {
    ACTIVE,
    #[default]
    PENDING,
    INACTIVE,
    BLOCKED,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct QueryResult {
    pub id: Uuid,
}
