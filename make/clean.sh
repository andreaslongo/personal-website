#!/usr/bin/env sh

set -o errexit  # -e: Exit when a command fails
set -o nounset  # -u: Treat unset variables as an error
set -o pipefail #   : The return value of a pipeline is the value of the last command that failed

# Debug options
# set -o noexec   # -n: Read and parse but do not execute commands
# set -o verbose  # -v: Print shell input lines as they are read
# set -o xtrace   # -x: Print commands before execution


# clean
rm -rf .hugo_build.lock
