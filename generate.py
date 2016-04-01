# -*- coding: utf-8 -*-
"""
Script for generating tsung XML configuration files from jinja2 templates
"""

import re
from sys import argv, exit
from jinja2 import Environment, FileSystemLoader

sql_split_re = re.compile(';\s*\n')

env = Environment(loader=FileSystemLoader('templates'))
tsung_template = env.get_template('tsung.xml')


def load_sql(sql, test, **kwargs):
    """
    Load SQL file as template.
    """
    test_template = env.get_template(test)
    return sql_split_re.split(
        test_template.render(sql=sql, **kwargs).rstrip(';'))


def generate(sql, test):
    """
    Generate tsung-<pgsql|mysql>-<test>.xml output configuration.
    """
    if sql == 'mysql':
        kwargs = dict(port=3306, database='mysql',
                 user='root', password='')
    elif sql == 'pgsql':
        kwargs = dict(pg=True, port=5432, database='template1',
                 user='postgres', password='empty')
    with open('tsung-%s-%s.xml' % (sql, test), 'w') as config:
        config.write(tsung_template.render(
            sql=sql, migration=load_sql(sql, 'tests/%s.sql' % test, **kwargs),
            schema=load_sql(sql, 'schema.sql', **kwargs),
            workload_fill=load_sql(sql, 'workload_fill.sql', **kwargs),
            workload_test=load_sql(sql, 'workload_test.sql', **kwargs),
            **kwargs))


def get_tests():
    """
    Return all available tests.
    """
    tests = env.list_templates(
        filter_func=lambda f: f.startswith('test') and f.endswith('.sql'))
    return [t.split('/')[1].split('.')[0] for t in tests]


def generate_tests():
    """
    Generate all tests.
    """
    tests = get_tests()
    for test in tests:
        for sql in ['psql', 'mysql']:
            generate(sql, test)


if __name__ == '__main__':
    if len(argv) < 2 or argv[1] not in ('pgsql', 'mysql'):
        print ('''Usage:
 %s <pgsql|mysql> <test>

Available tests:
 ''' % argv[0]) + ' '.join(get_tests())
        exit(1)

    generate(argv[1], argv[2])
