reverse_find_file(){
  target_file=$1

  test_dir=$(pwd)
  while [ ! -s $target_file ] ; do
    parent_dir=$(dirname $test_dir)

    target_file="$parent_dir/$target_file"

    [[ $test_dir = / ]] && break

    test_dir=$parent_dir
  done

  if [ -s $target_file ]; then
    echo $target_file
  fi
}
