#!/bin/bash

# if cleanup not performed
if [[ -a /tmp/ee_swap ]] ; then
  echo '/tmp/ee_swap is not empty'
  exit 1
fi

# if $1 is neither a file nor a directory
if [ ! -f $1 ] && [ ! -d $1 ] ; then
  echo "swap: $1: No such file or directory"
  file_not_found=1
fi

# if $2 is neither a file nor a directory
if [ ! -f $2 ] && [ ! -d $2 ]; then
  echo "swap: $2: No such file or directory"
  file_not_found=1
fi

if [[ $file_not_found ]] ; then
  unset file_not_found
  exit 2
fi

# teacup
cp $1 /tmp/ee_swap
rm -rf $1
cp $2 $1
cp /tmp/ee_swap $2

# cleanup
rm -rf /tmp/ee_swap