#!/usr/bin/env bash
# split arg into array of strings separated by newlines
commands=()
readarray -t commands <<<"$1"
# run commands, checking them against a regex to be sure they're actually stern commands
for i in "${commands[@]}"; do
  if [[ "$i" =~ ^stern.* ]]; then
    echo "Running stern command: $i"
    # run with a timeout because stern will tail forever if you don't, so this will print logs for 10 seconds then exit
#    timeout 10 $i
  else
    # don't run arbitrary commands
    echo "Invalid stern command: $i , not running command"
  fi
done