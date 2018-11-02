#!/bin/bash

# exit code 1 is a php error
exit_missing_port=2
exit_invalid_port=3

usage(){
  echo "Devserve:
  Starts a development server on a given port number
  Usage: devserve [port:n+]"
}

port=$1

if [ -z $port ] ; then
  usage
  exit $exit_missing_port
fi

if [[ ! $port =~ ^[0-9]+$ ]] ; then
  usage
  exit $exit_invalid_port
fi

line=$(ifconfig | grep 192 | head -n 1)

regex='^.*(([0-9]{3}\.[0-9]{1,3}\.[0-9]{1,3}\.[1-9]{1,3}))'
ip=$([[ $line =~ $regex ]] &&
  echo ${BASH_REMATCH[1]})

host="$ip:$port"

echo "Starting local development server on:
  $host
"

php -S $host