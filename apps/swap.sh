#!/bin/bash

# Exit codes
exit_teacup_not_empty=1
exit_arguments_missing=2
exit_file_not_found=3

teacup_location='/tmp/ee_swap'

# if cleanup not performed
if [[ -a $teacup_location ]] ; then
  echo "$teacup_location is not empty"
  exit $exit_teacup_not_empty
fi

# if arguments missing
if [ -z $1 ] || [ -z $2 ]; then
  echo "swap: Swap expects exactly two arguments"
  exit $exit_arguments_missing
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
  exit $exit_file_not_found
fi

# teacup
cp $1 $teacup_location
rm -rf $1
cp $2 $1
cp $teacup_location $2

# cleanup
rm -rf $teacup_location