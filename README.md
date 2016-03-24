# ddload
Load tests of various DDL operations in PostgreSQL and MySQL

## Install

First, install the dependencies:

```
sudo apt-add-repository ppa:tsung/stable
sudo apt-get update
sudo apt-get install tsung python-jinja2 postgresql mysql-server

```

Set MySQL password to an empty string and the PostgreSQL to an "empty" string:

```
mysql> update mysql.user set password = '' where user = 'root';
Query OK, 5 rows affected (0.00 sec)
Rows matched: 5  Changed: 5  Warnings: 0

postgres=# \password postgres 
Enter new password: empty
Enter it again: empty
postgres=#
```

We use Tsung to run the tests. Type `make` to build the XML configs and run the
tests. Type `make open` to generate and open HTML reports inside a web browser.
