# -*- coding: utf-8 -*-
"""
Generate and open HTML reports.
"""

from glob import glob
from os import system

for d in glob('tsung/*/*'):
    system('cd %s; /usr/lib/tsung/bin/tsung_stats.pl --title %s;'
           ' firefox graph.html' % (d, d.split('/')[1]))
