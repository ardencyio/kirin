CREATE MIGRATION m13hgrmwiafuw5zbqe66bzrtmdk2mmozcix3fqlnyjwljjzgn6riqa
    ONTO m1gdxio5jxlaybb6qqubk3us3jtkpb3okvrnt44waurqbqoo35r3fq
{
  ALTER TYPE default::Token {
      ALTER PROPERTY expiry {
          RESET OPTIONALITY;
      };
  };
  ALTER TYPE default::Token {
      ALTER PROPERTY refresh_token {
          RESET OPTIONALITY;
      };
  };
  ALTER TYPE default::Token {
      ALTER PROPERTY scope {
          RESET OPTIONALITY;
      };
  };
  ALTER TYPE default::Token {
      ALTER PROPERTY tokenid {
          RESET OPTIONALITY;
      };
  };
  ALTER TYPE default::Token {
      ALTER PROPERTY type {
          RESET OPTIONALITY;
      };
  };
};
