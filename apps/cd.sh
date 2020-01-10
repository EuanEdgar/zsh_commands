cd(){
  builtin cd "$@"
  exit_code=$?

  set_folder_colour
  return $exit_code
}
