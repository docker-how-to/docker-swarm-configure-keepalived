#!/usr/bin/env bash
dockerid="$(docker info | grep -i "nodeid:" | awk -F ':' '{print $2}' | sed -e 's/^[[:space:]]*//')"
echo "Docker id: $dockerid"

status="$(docker node list | grep -i $dockerid | awk -F ' ' '{print $5}')"
echo "Status: $status"

active="active"
shopt -s nocasematch
case "$status" in
 $active ) ecode=0 ;;
 *) ecode=1 ;;
esac

echo "exiting with $ecode"
exit $ecode
