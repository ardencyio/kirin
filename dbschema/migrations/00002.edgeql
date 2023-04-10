CREATE MIGRATION m1gdxio5jxlaybb6qqubk3us3jtkpb3okvrnt44waurqbqoo35r3fq
    ONTO m1qhduikijva23jzcvc66ya7gxsg3sozvg2yqi6zt53b76zjiqm7ua
{
  ALTER TYPE default::Identity {
      CREATE CONSTRAINT std::exclusive ON ((.email, .provider));
  };
  ALTER TYPE default::Identity {
      ALTER PROPERTY login {
          RESET OPTIONALITY;
      };
  };
  ALTER TYPE default::Identity {
      ALTER PROPERTY password {
          RESET OPTIONALITY;
      };
  };
};
