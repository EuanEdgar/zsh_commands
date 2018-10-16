#!/bin/bash

# Exit codes
exit_teacup_not_empty=1
exit_arguments_missing=2
exit_file_not_found=3
exit_invalid_options=4

teacup_location='/tmp/ee_swap'

usage() {
  echo "Swap:
  Swaps the names of two files or directories
  Usage: swap path/to/file1 path/to/file/2
  Options:
    -h: Show this message"
}

print_version() {
  echo 'Just be glad it exists at all'
}

get_long_option() {
  case $1 in
    help)
      usage
      exit 0
      ;;
    version)
      print_version
      exit 0
      ;;
  esac
}

while getopts ":h:v:-:" opt; do
  case $opt in
    -)
      get_long_option "$OPTARG"
      exit 0
      ;;
    h)
      usage
      exit 0
      ;;
    v)
      print_version
      exit 0
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage
      exit $exit_invalid_options
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      usage
      exit $exit_invalid_options
      ;;
  esac
done

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