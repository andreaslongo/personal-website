#!/usr/bin/env python3
"""Publish article."""

import sys
from workflows import publish


arguments = sys.argv
dry_run = '--dry-run' in arguments

if dry_run:
    print('== Dry run', 69 * '=')

publish(dry_run=dry_run)
