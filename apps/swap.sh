#!/bin/bash

# if cleanup not performed
if [[ -a /tmp/ee_swap ]] ; then
  echo '/tmp/ee_swap is not empty'
  exit 1
fi

# teacup
cp $1 /tmp/ee_swap
rm -rf $1
cp $2 $1
cp /tmp/ee_swap $2

# cleanup
rm -rf /tmp/ee_swap