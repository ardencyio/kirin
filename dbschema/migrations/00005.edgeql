CREATE MIGRATION m1jia4tqkxchidv7jdffmk2rfhlhsbxk3aut63dlss43juctxym4na
    ONTO m1qimvdzlf5mkmypmuowfxo6gtekvsc5xwiagquaczokrnkt7xpxra
{
  ALTER TYPE default::Identity {
      CREATE INDEX ON (.login);
      CREATE INDEX ON (.email);
  };
  ALTER TYPE default::Provider {
      CREATE INDEX ON (.name);
  };
};
