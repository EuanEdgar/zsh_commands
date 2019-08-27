#!/bin/bash

backup(){
  file=$1

  if [ -f $file ]; then
    backup_target="$file.bak"

    attempt=1
    while [[ -f $backup_target ]]; do
      attempt=$((attempt+1))

      new_backup_target="$file.bak$attempt"
      echo "$backup_target already exists, trying $new_backup_target..."
      backup_target=$new_backup_target
    done

    cp $file $backup_target
    echo "Backed up $file to $backup_target."
  else
    echo "Target $file is not a file"
    false
  fi
}

restore(){
  file=$1

  if [ -f $file ] && [[ $file =~ (.*)\.bak([0-9]+)?$ ]]; then
    basefile=$(echo "${BASH_REMATCH[1]}")
    filepattern="$basefile.bak*"
    read -p "This will overwrite $basefile and $(ls $filepattern | wc -l | xargs) backup file(s). Continue? [Y/n] " -r
    if [ $REPLY = y ] || [ $REPLY = Y ]; then
      mv $file $basefile
      if [ ! -z $(for f in $filepattern; do
        [ -e "$f" ] && echo 'found'
        break
      done) ]; then
        rm $filepattern
      fi
    fi
  elif [ -f $file ]; then
    echo "Restore file..."
  else
    echo "$file is not a backup"
  fi
}

if [ $1 = "restore" ]; then
  restore "${@:2}"
elif [ $1 = "create" ]; then
  backup "${@:2}"
else
  backup "$@"
fi
