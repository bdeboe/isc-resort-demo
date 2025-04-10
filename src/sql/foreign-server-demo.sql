-- create foreign server representing our MySQL database
CREATE FOREIGN SERVER Ready.MySQL
    FOREIGN DATA WRAPPER JDBC
    CONNECTION 'mysql'
    NODELIMITEDIDS
;

-- create a foreign table based off a table in the remote server
CREATE FOREIGN TABLE Ready.Reservations
    SERVER Ready.MySQL
    TABLE 'activereservations'
;

-- now we'll create a demo user to show you more about the new privileges for foreign tables
CREATE USER ready2025 IDENTIFIED BY "alreadyready"
;

GRANT SELECT ON SCHEMA Ready TO ready2025
;
GRANT USE ON SERVER Ready.MySQL TO ready2025
;

-- for admin users, there's a new %MANAGE_FOREIGN_SERVER admin privilege to govern exactly that
CREATE USER admin2025 IDENTIFIED BY "alreadyready"
;
GRANT %MANAGE_FOREIGN_SERVER, %CREATE_TABLE, %DROP_TABLE TO admin2025
;
