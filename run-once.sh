#Git diff-so-fancy
which diff-so-fancy
installed=$?
# If not installed
if [[ $installed = 1 ]]; then
  sudo npm install -g diff-so-fancy
  $installed = $?
fi
# If already installed or successfuly installed
if [[ $installed = 0 ]]; then
  sudo git config --global core.pager "diff-so-fancy | less --tabs=2 -RFX"
else
  echo "diff-so-fancy install failed."
  echo "continuing..."
fi
unset installed