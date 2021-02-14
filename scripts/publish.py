#!/usr/bin/env python3
"""Publish article."""

import sys
from workflows import parse_arguments, publish


branch, dry_run = parse_arguments(sys.argv)


publish(branch, dry_run=dry_run)
