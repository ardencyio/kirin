CREATE MIGRATION m1xfsvvqedn2jhkbevk3p5zof4wugcfeoxlgbwbkajr7ol3udcel7a
    ONTO m1hv6kdqn7v3rbeun5ssdxrva4xn2yf2giovbcj63c3cib2kmvzhzq
{
  ALTER TYPE default::Identity {
      ALTER LINK provider {
          SET default := (SELECT
              default::Provider FILTER
                  (.name = 'ardency')
          LIMIT
              1
          );
      };
  };
};
