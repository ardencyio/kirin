use serde::{Deserialize, Serialize};
use uuid::Uuid;

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Identity {
    id: Uuid,
    email: String,
    login: String,
    password: String,
    preferred: bool,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct NewIdentity {
    pub email: String,
    pub login: String,
    pub password: String,
    pub preferred: bool,
}
