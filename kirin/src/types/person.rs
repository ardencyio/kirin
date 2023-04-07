use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

// use crate::types::identity::{Identity, NewIdentity};
use crate::types::Status;

#[derive(Default, Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct Person {
    pub id: Uuid,
    pub firstname: String,
    pub lastname: String,
    pub status: Status,
    // pub identity: Vec<Identity>,
    pub created: DateTime<Utc>,
    pub updated: DateTime<Utc>,
}

///
/// ```json
/// {
///   "firstname": "tony",
///   "lastname": "stark",
///   "nickname": "ironman",
///   "status": "PENDING",
///   "email": "ironman@avengers.com",
///   "login": "@ironman",
///   "password": "$2b$12$lH23QLU6pRf9g8jJW91HvOrPbGDFzwZ6x8Lz0jKkMQ7Bmgf1Sw9He",
///   "preferred": true,
///   "provider": "ardency"
/// }
/// ```
#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct NewPerson {
    pub firstname: String,
    pub lastname: String,
    pub nickname: String,
    pub status: Status,
    pub email: String,
    pub login: String,
    pub password: String,
    pub preferred: bool,
    pub provider: String,
    // pub identity: Vec<NewIdentity>,
}
