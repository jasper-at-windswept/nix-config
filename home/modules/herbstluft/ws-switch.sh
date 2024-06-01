#!/usr/bin/env bash
# Set the number of your first/main monitor, find it under `hyrpctl monitors` then find your monitor and it is the ID: value at the top.
first=0
# Set the number of your secondary monitor
second=1
# Set the number of your third monitor
third=2

# Set the number of workspaces per screen
ws_per_monitor=3

monitor=$(herbstclient list_monitors | grep -E "[FOCUS]" | sed -e 's/^[ \t]*//' | cut -c1)
if [[ $monitor == *"$first"* ]]; then
	if [[ $1 == 1 ]]; then
		calc=1
	elif [[ $1 == 2 ]]; then
		calc=4
	elif [[ $1 == 3 ]]; then
		calc=7
	fi
	if [[ $2 == "move" ]]; then
		herbstclient move $calc
	else
		herbstclient use $calc
	fi
elif [[ $monitor == *"$second"* ]]; then
	if [[ $1 == 1 ]]; then
		calc=2
	elif [[ $1 == 2 ]]; then
		calc=5
	elif [[ $1 == 3 ]]; then
		calc=8
	fi
	if [[ $2 == "move" ]]; then
		herbstclient move $calc
	else
		herbstclient use $calc
	fi
elif [[ $monitor == *"$third"* ]]; then
	if [[ $1 == 1 ]]; then
		calc=3
	elif [[ $1 == 2 ]]; then
		calc=6
	elif [[ $1 == 3 ]]; then
		calc=9
	fi
	if [[ $2 == "move" ]]; then
		herbstclient move $calc
	else
		herbstclient use $calc
	fi
fi
