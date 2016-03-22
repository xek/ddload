# -*- coding: utf-8 -*-

from sys import argv, exit
from jinja2 import Environment, FileSystemLoader
env = Environment(loader=FileSystemLoader('templates'))

tsung_config = env.get_template('tsung.xml')

def generate(sql, **kwargs):
    with open('tsung-%s.xml' % sql, 'w') as config:
        config.write(tsung_config.render(sql=sql, **kwargs))

if __name__ == '__main__':
    sql = argv[1]
    assert sql in ('pgsql', 'mysql')
    if sql == 'mysql':
        generate(sql, port=3306)
    elif sql == 'pgsql':
        generate(sql, port=5432)
    else:
        exit(1)
