#!/usr/bin/env bash
# split arg into array of strings separated by newlines
commands=()
readarray -t commands <<<"$1"
# run commands, checking them against a regex to be sure they're actually kubectl commands
for i in "${commands[@]}"; do
  if [[ $i ]]; then
    if [[ "$i" =~ ^kubectl.* ]]; then
      echo "Running kubectl command: $i"
      # run with a timeout because kubectl will tail forever if you don't, so this will print logs for 5 seconds then exit
      timeout 5 $i
    else
      # don't run arbitrary commands
      echo "Invalid kubectl command: $i , not running command"
    fi
  fi
done