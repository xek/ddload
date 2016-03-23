# ddload
Load tests of various DDL operations in PostgreSQL and MySQL

## Install

First, install the dependencies:

```
sudo apt-add-repository ppa:tsung/stable
sudo apt-get update
sudo apt-get install tsung python-jinja2
```

We use Tsung to run the tests. Type `make` to build the XML configs and run the
tests. Type `make open` to generate and open HTML reports inside a web browser.
