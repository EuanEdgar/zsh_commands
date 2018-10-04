check_if_installed(){
  which $1
  installed=$?
}

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
