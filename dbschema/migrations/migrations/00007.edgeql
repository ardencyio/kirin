CREATE MIGRATION m1hv6kdqn7v3rbeun5ssdxrva4xn2yf2giovbcj63c3cib2kmvzhzq
    ONTO m1jesibagu3obqttcxtuje5pc6udsefoiqiqq3zst5wic4ir6jjd3a
{
  ALTER TYPE default::Timestamp {
      ALTER PROPERTY created {
          SET readonly := true;
      };
  };
  ALTER TYPE default::Provider {
      CREATE CONSTRAINT std::exclusive ON (.name);
  };
};
