cd(){
  args=$@
  builtin cd "$@"
  if [ -s .colour ]; then
    colour $(cat .colour)
  fi
}
