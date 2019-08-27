check_if_installed(){
  which $1
  installed=$?
}

check_if_installed brew
if [[ $installed = 0 ]]; then
  os="mac"
else
  check_if_installed apt
  if [[ $installed = 0 ]]; then
    os="ubuntu"
  fi
fi


if [[ $os = "ubuntu" ]]; then
  sudo apt update
fi

check_if_installed npm
if [[ $installed = 1 ]]; then
  echo "install npm to continue"
  unset installed
  exit 1
fi
unset installed

#Git diff-so-fancy
check_if_installed diff-so-fancy
# If not installed
if [[ $installed = 1 ]]; then
  sudo npm install -g diff-so-fancy
fi
# If already installed or successfuly installed
check_if_installed diff-so-fancy
if [[ $installed = 0 ]]; then
  sudo git config --global core.pager "diff-so-fancy | less --tabs=2 -RFX"
else
  echo "diff-so-fancy install failed."
  echo "continuing..."
fi
unset installed

# git git
git config --global alias.git '!exec git'

# TLDR
check_if_installed tldr
# If not installed
if [[ $installed = 1 ]]; then
  sudo npm install -g tldr
fi

check_if_installed tldr
if [[ $installed = 1 ]]; then
  echo "tldr install failed"
  echo "continuing..."
fi

unset installed

check_if_installed thefuck
if [[ $installed = 1 ]]; then
  if [[ $os = "mac" ]]; then
    brew install thefuck
  elif [[ $os = "ubuntu" ]]; then
    sudo apt install python3-dev python3-pip
    sudo pip3 install thefuck
  fi
fi

check_if_installed thefuck
if [[ $installed = 1 ]]; then
  echo "thefuck install failed"
  echo "continuing..."
fi
unset installed

check_if_installed bat
if [[ $installed = 1 ]]; then
  if [[ $os = "mac" ]]; then
    brew install bat

    check_if_installed bat
    if [[ $installed ]]; then
      echo "bat install failed\
      continuing..."
    fi
  elif [[ $ox = "ubuntu" ]]; then
    echo "To install bat (cat replacement), follow instructions here:\
    https://github.com/sharkdp/bat#installation"
  fi
fi

unset installed

chmod +x "$COMMANDS_PATH/apps/swap.sh"
chmod +x "$COMMANDS_PATH/apps/php_serve.sh"

if [[ $TERM_PROGRAM = 'iTerm.app' ]]; then
  chmod +x "$COMMANDS_PATH/apps/colour.sh"
fi

if [ ! -f ~/.gitignore_global ]; then
  touch ~/.gitignore_global
  git config --global core.excludesfile ~/.gitignore_global
fi
