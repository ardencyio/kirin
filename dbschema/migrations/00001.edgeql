CREATE MIGRATION m1tpdky6agwovc234pt2mymzebr6jvmi4kk2fsxmrfwxqpebgdrdkq
    ONTO initial
{
  CREATE FUTURE nonrecursive_access_policies;
  CREATE ABSTRACT TYPE default::Timestamp {
      CREATE REQUIRED PROPERTY created -> std::datetime {
          SET default := (std::datetime_current());
          SET readonly := true;
      };
      CREATE REQUIRED PROPERTY updated -> std::datetime {
          SET default := (std::datetime_current());
      };
  };
  CREATE TYPE default::Provider EXTENDING default::Timestamp {
      CREATE REQUIRED PROPERTY name -> std::str;
      CREATE CONSTRAINT std::exclusive ON (.name);
      CREATE INDEX ON (.name);
      CREATE PROPERTY client -> std::str;
      CREATE PROPERTY grant_type -> std::str;
      CREATE PROPERTY meta -> std::json;
      CREATE PROPERTY redirect_url -> std::str;
      CREATE PROPERTY secret -> std::str;
  };
  CREATE TYPE default::Identity EXTENDING default::Timestamp {
      CREATE LINK provider -> default::Provider {
          SET default := (SELECT
              default::Provider FILTER
                  (.name = 'ardency')
          LIMIT
              1
          );
      };
      CREATE REQUIRED PROPERTY email -> std::str;
      CREATE CONSTRAINT std::exclusive ON ((.email, .provider));
      CREATE PROPERTY login -> std::str;
      CREATE INDEX ON (.login);
      CREATE INDEX ON (.email);
      CREATE PROPERTY password -> std::str;
      CREATE REQUIRED PROPERTY preferred -> std::bool {
          SET default := false;
      };
  };
  CREATE TYPE default::Token EXTENDING default::Timestamp {
      CREATE REQUIRED LINK identity -> default::Identity;
      CREATE REQUIRED PROPERTY access_token -> std::str;
      CREATE PROPERTY expiry -> std::int64;
      CREATE PROPERTY refresh_token -> std::str;
      CREATE PROPERTY scope -> std::str;
      CREATE PROPERTY token_type -> std::str;
      CREATE PROPERTY tokenid -> std::str;
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
