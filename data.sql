#First, try running this query without an index:
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    jobTitle = 'Sales Rep';

#Use the CREATE INDEX statement to create a new index for a table.
CREATE INDEX idxTitle ON employees(jobTitle);

#Check if the index was created:

SHOW INDEXES FROM employees;

#Test the performance plan:
EXPLAIN SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    jobTitle = 'Sales Rep';

#Use the DROP INDEX statement to remove an existing index.
DROP INDEX idxTitle ON employees;

#Let’s create a new user:
CREATE USER josephcoder123@localhost IDENTIFIED BY '1234';

#To show the users on the current MySQL Server:
SELECT user FROM mysql.user;

#To change the password of the a user use the ALTER … IDENTIFIED BY statement

ALTER USER josephcoder123@localhost IDENTIFIED BY 'abcd'; -- new password

#The RENAME USER statement allows you to rename one or more existing user accounts.
RENAME USER josephcoder123@localhost TO josephcoder@localhost;

#To remove a user account from the MySQL Server, you use the DROP USER statement as follows:
DROP USER josephcoder@localhost;

#To grant all privileges in all databases in the current database server
GRANT ALL ON *.* TO josephcoder123@localhost;

#To show the privileges assigned to josephcoder123

SHOW GRANTS FOR josephcoder123@localhost;

#Database Privileges
-- create a new user
CREATE USER mercy@localhost IDENTIFIED BY '1234';
-- giving access to one database only
GRANT SELECT, INSERT, UPDATE, DELETE ON salesdb.* TO 'mercy'@'localhost';

#Table Privileges

-- create a new user
CREATE USER gerald@localhost IDENTIFIED BY '1234';
-- giving access to only one table inside the database.
GRANT SELECT, INSERT ON salesdb.customers TO 'gerald'@'localhost';

#Roles in the Coffeehouse

CREATE DATABASE coffeehouse;
USE coffeehouse;
CREATE TABLE customers(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL, 
    last_name VARCHAR(255) NOT NULL, 
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(255) UNIQUE,
    amount DECIMAL(10,2) CHECK(amount>0)
);
INSERT INTO customers(first_name,last_name,phone,email,amount)
VALUES
('James','brown','123456','james@mail.com',300),
('Michael','white','123789','white@mail.com',150),
('Mary','smith','123789','smith@mail.com',150),
('Louis','peters','123789','peters@mail.com',1100),
('Brenda','audrey','123789','audrey@mail.com',1200);
SELECT * FROM customers;

#creating roles:

CREATE ROLE dev, accounts, barista,interns;

#Grant privileges to each role:
The following statement grants all privileges to dev role:

GRANT ALL ON coffeehouse.* TO dev;

#The following statement grants INSERT, UPDATE, and DELETE privileges to accounts role
GRANT INSERT, UPDATE, DELETE ON coffeehouse.* TO accounts;

#The following statement grants SELECT privilege to barista role

GRANT SELECT ON cofeehouse.* TO barista;

#Assigning roles to user accounts

-- developer user 
CREATE USER henry@localhost IDENTIFIED BY 'pass';

-- read access user
CREATE USER wayne@localhost IDENTIFIED BY 'pass';
CREATE USER testuser@localhost IDENTIFIED BY 'pass';     

-- read/write users
CREATE USER brenda@localhost IDENTIFIED BY '1234';   
CREATE USER ann@localhost IDENTIFIED BY '1234';

#To verify the role assignments:

SHOW GRANTS FOR henry@localhost;

#Assigning Permission to users using ROLES

GRANT dev TO henry@localhost;
GRANT  accounts TO brenda@localhost;
GRANT barista TO wayne@localhost;

#To specify which roles should be active each time a user account connects to the database server,

SET DEFAULT ROLE ALL TO testuser@localhost;

#Revoking privileges from roles

REVOKE INSERT, UPDATE, DELETE  ON crm.* FROM accounts;

#Removing roles To delete one or more roles
DROP ROLE barista;

To revokes one or more privileges from a user account.

REVOKE ALL, GRANT OPTION FROM josephcoder123@localhost;

#revoke privileges from a user

-- create a new user 
CREATE USER tamara@localhost IDENTIFIED BY '1234';
-- grant privilege
GRANT SELECT, UPDATE, INSERT ON salesdb.* TO tamara@localhost;
-- display the granted privileges
SHOW GRANTS FOR tamara@localhost;
-- revoke privilege
REVOKE INSERT, UPDATE ON salesdb.* FROM  tamara@localhost;