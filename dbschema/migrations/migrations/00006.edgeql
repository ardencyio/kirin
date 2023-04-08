CREATE MIGRATION m1jesibagu3obqttcxtuje5pc6udsefoiqiqq3zst5wic4ir6jjd3a
    ONTO m1jia4tqkxchidv7jdffmk2rfhlhsbxk3aut63dlss43juctxym4na
{
  ALTER TYPE default::Identity {
      ALTER LINK provider {
          RESET OPTIONALITY;
      };
  };
  ALTER TYPE default::Provider {
      ALTER PROPERTY client {
          RESET OPTIONALITY;
      };
  };
  ALTER TYPE default::Provider {
      ALTER PROPERTY grant_type {
          RESET OPTIONALITY;
      };
  };
  ALTER TYPE default::Provider {
      ALTER PROPERTY redirect_url {
          RESET OPTIONALITY;
      };
  };
  ALTER TYPE default::Provider {
      ALTER PROPERTY secret {
          RESET OPTIONALITY;
      };
  };
};
