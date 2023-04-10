CREATE MIGRATION m1qimvdzlf5mkmypmuowfxo6gtekvsc5xwiagquaczokrnkt7xpxra
    ONTO m13hgrmwiafuw5zbqe66bzrtmdk2mmozcix3fqlnyjwljjzgn6riqa
{
  ALTER TYPE default::Token {
      ALTER PROPERTY type {
          RENAME TO token_type;
      };
  };
};
