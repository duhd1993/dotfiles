#!/usr/bin/env bash

TM=/usr/local/bin/tmux
sessions=$($TM list-sessions -F '#S' | grep '^[0-9]\+$' | sort -n)
new=0
for old in $sessions
do
  $TM rename -t $old $new
  ((new++))
done
