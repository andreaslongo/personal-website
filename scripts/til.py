#!/usr/bin/env python3
"""Start new TIL article."""

import sys
from workflows import new_til


arguments = sys.argv
dry_run = '--dry-run' in arguments

if dry_run:
    arguments.remove('--dry-run')
    print('== Dry run', 69 * '=')

_, branch = arguments

new_til(branch, dry_run=dry_run)
