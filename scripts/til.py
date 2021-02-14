#!/usr/bin/env python3
"""Start new TIL article."""

import sys
from workflows import parse_arguments, new_til


branch, dry_run = parse_arguments(sys.argv)


new_til(branch, dry_run=dry_run)
