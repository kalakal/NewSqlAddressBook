================================================================ UC1 =============================================================================

								Created AddressBookSystems database
		    			     ****************************************

mysql> create database AddressBookSystems;
Query OK, 1 row affected (0.01 sec)

mysql> use AddressBookSystems;
Database changed
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| addressbooksystems |
| demo               |
| information_schema |
| mysql              |
| payrollservices    |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
9 rows in set (0.01 sec)

============================================================================================ UC2 =============================================================================================================

 CREATE TABLE addressBook(
    ->     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ->     firstName VARCHAR(9) NOT NULL,
    ->     lastName VARCHAR(9) NOT NULL,
    ->     city VARCHAR(15) NOT NULL,
    ->     state VARCHAR(15) NOT NULL,
    ->     zip VARCHAR(8) NOT NULL,
    ->     phn VARCHAR(10) NOT NULL,
    ->     PRIMARY KEY (id));
Query OK, 0 rows affected (0.02 sec)

mysql>  Describe addressbook;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| id        | int unsigned | NO   | PRI | NULL    | auto_increment |
| firstName | varchar(9)   | NO   |     | NULL    |                |
| lastName  | varchar(9)   | NO   |     | NULL    |                |
| city      | varchar(15)  | NO   |     | NULL    |                |
| state     | varchar(15)  | NO   |     | NULL    |                |
| zip       | varchar(8)   | NO   |     | NULL    |                |
| phn       | varchar(10)  | NO   |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
7 rows in set (0.00 sec)



============================================================================================== UC3 ===================================================================================================================

                                                        Ability to insert new contacts to address book
                                                       *************************************************

 mysql>  INSERT INTO addressbook(
FirstName,LastName,City,State,Zip,Phn)  VALUES
('Tom','John','Bangalore','Karnataka','123456','9876544357'),
('Anna','Ben','kochi','Kerala','67900456','9234512376'),
('Veena','Madhav','Thrissur','Kerala','67100101','7170512376'),
('Ravi','Varma','Trivandrum','Kerala','67900151','870512376'),
('John','Samuel','Mysore','Karnataka','4557688','5643427919');
 Query OK, 5 rows affected (0.01 sec)
 Records: 5  Duplicates: 0  Warnings: 0


 mysql> SELECT * FROM addressBook;
 +----+-----------+----------+------------+-----------+----------+------------+
 | id | firstName | lastName | city       | state     | zip      | phn        |
 +----+-----------+----------+------------+-----------+----------+------------+
 |  1 | Tom       | John     | Bangalore  | Karnataka | 123456   | 9876544357 |
 |  2 | Anna      | Ben      | kochi      | Kerala    | 67900456 | 9234512376 |
 |  3 | Veena     | Madhav   | Thrissur   | Kerala    | 67100101 | 7170512376 |
 |  4 | Ravi      | Varma    | Trivandrum | Kerala    | 67900151 | 870512376  |
 |  5 | John      | Samuel   | Mysore     | Karnataka | 4557688  | 5643427919 |
 +----+-----------+----------+------------+-----------+----------+------------+
 5 rows in set (0.01 sec)


 ================================================================================ UC4 =============================================================================================================

                                                                    Update Contact
                                                                  ******************

mysql> update addressbook set city ='Bangalore' where firstName = 'John';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM addressBook;
+----+-----------+----------+------------+-----------+----------+------------+
| id | firstName | lastName | city       | state     | zip      | phn        |
+----+-----------+----------+------------+-----------+----------+------------+
|  1 | Tom       | John     | Bangalore  | Karnataka | 123456   | 9876544357 |
|  2 | Anna      | Ben      | kochi      | Kerala    | 67900456 | 9234512376 |
|  3 | Veena     | Madhav   | Thrissur   | Kerala    | 67100101 | 7170512376 |
|  4 | Ravi      | Varma    | Trivandrum | Kerala    | 67900151 | 870512376  |
|  5 | John      | Samuel   | Bangalore  | Karnataka | 4557688  | 5643427919 |
+----+-----------+----------+------------+-----------+----------+------------+
5 rows in set (0.00 sec)


=========================================================================== UC5 =====================================================================================================================

                                                            DELETE CONTACT
                                                           ****************

 mysql> DELETE FROM addressbook  where firstName = 'Ravi';
 Query OK, 1 row affected (0.01 sec)

 mysql> SELECT * FROM addressBook;
 +----+-----------+----------+-----------+-----------+----------+------------+
 | id | firstName | lastName | city      | state     | zip      | phn        |
 +----+-----------+----------+-----------+-----------+----------+------------+
 |  1 | Tom       | John     | Bangalore | Karnataka | 123456   | 9876544357 |
 |  2 | Anna      | Ben      | kochi     | Kerala    | 67900456 | 9234512376 |
 |  3 | Veena     | Madhav   | Thrissur  | Kerala    | 67100101 | 7170512376 |
 |  5 | John      | Samuel   | Bangalore | Karnataka | 4557688  | 5643427919 |
 +----+-----------+----------+-----------+-----------+----------+------------+
 4 rows in set (0.00 sec)


======================================================================== UC6 =====================================================================

                                        Ability to Retrieve Person belonging to a City or State from the Address Book
                                      *********************************************************************************

mysql> Select firstName from addressbook where city = 'Kochi';
+-----------+
| firstName |
+-----------+
| Anna      |
+-----------+
1 row in set (0.00 sec)

mysql> Select firstName from addressbook where state = 'Kerala';
+-----------+
| firstName |
+-----------+
| Anna      |
| Veena     |
+-----------+


==============================================================================  UC7 ========================================================================================

                                                 Ability to understand the size of address book by City and State
                                                ******************************************************************

    mysql> SELECT COUNT(*) FROM addressbook where state = 'kerala';
    +----------+
    | COUNT(*) |
    +----------+
    |        2 |
    +----------+
    1 row in set (0.01 sec)

    mysql> SELECT COUNT(*) FROM addressbook where city = 'Bangalore';
    +----------+
    | COUNT(*) |
    +----------+
    |        2 |
    +----------+
    1 row in set (0.00 sec)


==============================================================================  UC8 ========================================================================================

                                             Ability to retrieve entries sorted alphabetically by Person’s name for a given city
                                            *************************************************************************************

mysql> SELECT * FROM addressbook where state = 'Kerala' ORDER BY firstName ASC;
+----+-----------+----------+----------+--------+----------+------------+
| id | firstName | lastName | city     | state  | zip      | phn        |
+----+-----------+----------+----------+--------+----------+------------+
|  2 | Anna      | Ben      | kochi    | Kerala | 67900456 | 9234512376 |
|  3 | Veena     | Madhav   | Thrissur | Kerala | 67100101 | 7170512376 |
+----+-----------+----------+----------+--------+----------+------------+
2 rows in set (0.00 sec)

==============================================================================  UC9 ========================================================================================

                                                    Ability to identify each Address Book with name and Type
                                                   **********************************************************

mysql> SELECT * FROM addressbook;
+----+-----------+----------+-----------+-----------+----------+------------+--------+
| id | firstName | lastName | city      | state     | zip      | phn        | type   |
+----+-----------+----------+-----------+-----------+----------+------------+--------+
|  1 | Tom       | John     | Bangalore | Karnataka | 123456   | 9876544357 | Friend |
|  2 | Anna      | Ben      | kochi     | Kerala    | 67900456 | 9234512376 | Family |
|  3 | Veena     | Madhav   | Thrissur  | Kerala    | 67100101 | 7170512376 | Friend |
|  5 | John      | Samuel   | Bangalore | Karnataka | 4557688  | 5643427919 | Family |
+----+-----------+----------+-----------+-----------+----------+------------+--------+
4 rows in set (0.00 sec)


==============================================================================  UC10 ========================================================================================

                                                          Ability to get number of contact persons i.e. count by type
                                                        ***************************************************************

    mysql>  SELECT COUNT(*) FROM addressbook where type = 'family';
    +----------+
    | COUNT(*) |
    +----------+
    |        2 |
    +----------+
    1 row in set (0.00 sec)

    mysql>  SELECT COUNT(*) FROM addressbook where type = 'friend';
    +----------+
    | COUNT(*) |
    +----------+
    |        2 |
    +----------+
    1 row in set (0.00 sec)

==============================================================================  UC11 ========================================================================================

                                                         Ability to add a contact to both Friend and Family
                                                        ****************************************************

    mysql> SELECT * FROM addressbook;
    +----+-----------+----------+-----------+-----------+----------+------------+-------------------+
    | id | firstName | lastName | city      | state     | zip      | phn        | type              |
    +----+-----------+----------+-----------+-----------+----------+------------+-------------------+
    |  1 | Tom       | John     | Bangalore | Karnataka | 123456   | 9876544357 | Friend            |
    |  2 | Anna      | Ben      | kochi     | Kerala    | 67900456 | 9234512376 | Family            |
    |  3 | Veena     | Madhav   | Thrissur  | Kerala    | 67100101 | 7170512376 | Friend and family |
    |  5 | John      | Samuel   | Bangalore | Karnataka | 4557688  | 5643427919 | Family            |
    +----+-----------+----------+-----------+-----------+----------+------------+-------------------+
    4 rows in set (0.00 sec)


=====================================================================================================================================================================================

                                                    ER diagram
                                                   ************

    mysql> Create table Appartment(
        -> appartmentId int unsigned NOT NULL Auto_Increment,
        -> floor int not null,
        -> Primary key(appartmentId),
        -> foreign key(appartmentId) references addressbook(id));
    Query OK, 0 rows affected (0.02 sec)
    mysql> create table profession(
        -> id INT unsigned not null Auto_Increment,
        -> profession VARCHAR(15) NOT NULL,
        -> place VARCHAR(10) NOT NULL,
        -> vehicle VARCHAR(10) NOT NULL,
        -> primary key(id),
        -> foreign key (id) references addressbook(id));
    Query OK, 0 rows affected (0.02 sec)


    mysql> create table transportation(
        -> transportId int unsigned not null,
        -> modeOfTransportation varchar(10) not null,
        -> primary key(transportId),
        -> foreign Key (transportId) references addressbook(id));
    Query OK, 0 rows affected (0.02 sec)


