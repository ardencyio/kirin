# DESCRIBE SYSTEM CONFIG
CONFIGURE INSTANCE SET session_idle_transaction_timeout := <std::duration>'PT10S';
# DESCRIBE ROLES
ALTER ROLE edgedb { SET password_hash := 'SCRAM-SHA-256$4096:LqCBYA0F78eBYMp6gJmfAw==$zY0fORm0GtoprChXUaUyjdpCWV+mu6DluPFtbyekUus=:6kis4AxQiE4m3EscADJNkfXBGEOpv1loPm5M4MnB+44=';};
