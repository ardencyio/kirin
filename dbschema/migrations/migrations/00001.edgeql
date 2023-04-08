CREATE MIGRATION m1qhduikijva23jzcvc66ya7gxsg3sozvg2yqi6zt53b76zjiqm7ua
    ONTO initial
{
  CREATE FUTURE nonrecursive_access_policies;
  CREATE ABSTRACT TYPE default::Timestamp {
      CREATE REQUIRED PROPERTY created -> std::datetime {
          SET default := (std::datetime_current());
      };
      CREATE REQUIRED PROPERTY updated -> std::datetime {
          SET default := (std::datetime_current());
      };
  };
  CREATE TYPE default::Provider EXTENDING default::Timestamp {
      CREATE REQUIRED PROPERTY client -> std::str;
      CREATE REQUIRED PROPERTY grant_type -> std::str;
      CREATE PROPERTY meta -> std::json;
      CREATE REQUIRED PROPERTY name -> std::str;
      CREATE REQUIRED PROPERTY redirect_url -> std::str;
      CREATE REQUIRED PROPERTY secret -> std::str;
  };
  CREATE TYPE default::Identity EXTENDING default::Timestamp {
      CREATE REQUIRED LINK provider -> default::Provider;
      CREATE REQUIRED PROPERTY email -> std::str;
      CREATE REQUIRED PROPERTY login -> std::str;
      CREATE REQUIRED PROPERTY password -> std::str;
      CREATE REQUIRED PROPERTY preferred -> std::bool {
          SET default := false;
      };
  };
  CREATE TYPE default::Token EXTENDING default::Timestamp {
      CREATE REQUIRED LINK identity -> default::Identity;
      CREATE REQUIRED PROPERTY access_token -> std::str;
      CREATE REQUIRED PROPERTY expiry -> std::int64;
      CREATE REQUIRED PROPERTY refresh_token -> std::str;
      CREATE REQUIRED PROPERTY scope -> std::str;
      CREATE REQUIRED PROPERTY tokenid -> std::str;
      CREATE REQUIRED PROPERTY type -> std::str;
  };
  ALTER TYPE default::Identity {
      CREATE MULTI LINK tokens := (.<identity[IS default::Token]);
  };
  CREATE SCALAR TYPE default::Status EXTENDING enum<ACTIVE, PENDING, INACTIVE, BLOCKED>;
  CREATE TYPE default::Person EXTENDING default::Timestamp {
      CREATE MULTI LINK identity -> default::Identity;
      CREATE REQUIRED PROPERTY firstname -> std::str;
      CREATE REQUIRED PROPERTY lastname -> std::str;
      CREATE PROPERTY fullname := (((.firstname ++ ' ') ++ .lastname));
      CREATE INDEX ON (.fullname);
      CREATE PROPERTY nickname -> std::str;
      CREATE REQUIRED PROPERTY status -> default::Status {
          SET default := (default::Status.PENDING);
      };
  };
};
