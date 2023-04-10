insert Person {
  firstname := "steve",
  lastname := "rodgers",
  nickname := "captainamerica",
  status := (select Status.PENDING),
  identity := (insert Identity {
    email := "steve@avengers.com",
    login := "@captainamerica",
    password := "$2b$12$iwYBq3o3zgC10FgrmoB1vumRn7X9QZkbBbLVKFk/3B83q3us3CUtG",
    preferred := true,
    provider := (insert Provider {
      client := "a1b2c3d4e5f6g7h8i9j0",
      secret := "A1b2C3d4E5f6G7h8I9j0K1l2M3n4O5p6Q7r8S9t0U1v2W3x4Y5z6",
      name := "google",
      redirect_url := "https://example.com/google/callback",
      grant_type := "authorization_code",
      meta := to_json('{
        "service_name": "oauth",
        "data_types": [
          {"name": "client", "fields": ["client_id", "client_secret", "redirect_uri"]},
          {"name": "access_token", "fields": ["token", "expires_at", "client_id", "user_id"]},
          {"name": "refresh_token", "fields": ["token", "expires_at", "client_id", "user_id"]}
        ]
      }')
    })
  })
}

with data := <json>$data
insert Person {
  firstname := <str>data['firstname'],
  lastname :=  <str>data['lastname'],
  nickname := <str>data['nickname'],
  status :=  <Status>data['status'],
  identity := (insert Identity {
    email := <str>data['email'],
    login := <str>data['email'],
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

{
    "firstname": "tony",
    "lastname": "stark",
    "nickname": "ironman",
    "status": "PENDING",
    "email": "ironman@avengers.com",
    "login": "@ironman",
    "password": "$2b$12$lH23QLU6pRf9g8jJW91HvOrPbGDFzwZ6x8Lz0jKkMQ7Bmgf1Sw9He",
    "preferred": true,
    "provider": "ardency"
  }