use color_eyre::Result;
use serde_json::json;

use kirin::repository::get_client;
use kirin::repository::PersonRepository;
use kirin::service::GetPersonService;
use kirin::types::person::NewPerson;
use kirin::types::Status;

#[tokio::main]
async fn main() -> Result<()> {
    let d = json!({
        "firstname": "tony",
        "lastname": "stark",
        "nickname": "ironman",
        "status": Status::PENDING,
        "email": "ironmane@avengers.com",
        "login": "@ironman",
        "password": "$2b$12$lH23QLU6pRf9g8jJW91HvOrPbGDFzwZ6x8Lz0jKkMQ7Bmgf1Sw9He",
        "preferred": true,
        "provider": "ardency"
    });

    let p: NewPerson = serde_json::from_value(d)?;

    let client = get_client().await?;
    let repo = PersonRepository::new(client).await;
    let srvc = GetPersonService::new(repo);
    let r = srvc.register(p).await?;
    println!("{:?}", r);
    Ok(())
}
