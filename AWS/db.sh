# export database
mysqldump -h example.c7aws6qwenxf.af-south-1.rds.amazonaws.com -P 3306 -u admin -p example > example.sql

mysqldump --column-statistics=0 -h example.c7aws6qwenxf.af-south-1.rds.amazonaws.com -P 3306 -u admin -p --databases example > example.sql


# Always check the security-group ti know if inbound rule allowed 3306
# enter the database container
mysql -h test.cgek5kffk8ju.af-south-1.rds.amazonaws.com -P 3306 -u admin -p

# create database

CREATE DATABASE example;

# to enter database 

USE example;
SHOW TABLES;  -- Lists all the tables in the database.
SELECT * FROM your_table_name;  -- Replace your_table_name with the actual table name to view its contents.

exit
# import database 

mysql -h test.cgek5kffk8ju.af-south-1.rds.amazonaws.com -P 3306 -u admin -p example < example.sql


# Here's a breakdown of the command:

# -h test.cgek5kffk8ju.af-south-1.rds.amazonaws.com: Specifies the hostname or IP address of the MySQL server.
# -P 3306: Specifies the port number on which the MySQL server is running. The default MySQL port is 3306.
# -u admin: Specifies the MySQL username (in this case, "admin"). You can replace "admin" with the appropriate username.
# -p: This flag tells MySQL to prompt for the password.
# example: This is the name of the database you want to import into.
# < example.sql: Indicates that you want to import data from the example.sql file into the specified database.