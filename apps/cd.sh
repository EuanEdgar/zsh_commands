cd(){
  builtin cd "$@"

  colour_file='.colour'
  colour_dir=$(pwd)
  while [ ! -s $colour_file ] ; do
    parent_dir=$(dirname $colour_dir)

    colour_file="$parent_dir/.colour"

    [[ $colour_dir = / ]] && break

    colour_dir=$parent_dir
  done

  if [ -s $colour_file ]; then
    colour $(cat $colour_file)
  fi
}
