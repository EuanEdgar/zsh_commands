COMMANDS_PATH="$HOME/.zsh_commands"

#Git complete/prompt
export PATH="$COMMANDS_PATH/zsh-git-prompt/src/.bin:$PATH"
source $COMMANDS_PATH/zsh-git-prompt/zshrc.sh
PROMPT='%m%b$(git_super_status)%# '
zstyle ':completion:*:*:git:*' script $COMMANDS_PATH/git-tab-complete/git-completion.bash
fpath=(COMMANDS_PATH/git-tab-complete/ $fpath)

#Git commands
alias delete-merged="git branch --merged >/tmp/merged-branches && vi /tmp/merged-branches && xargs git branch -d </tmp/merged-branches; rm /tmp/merged-branches"

#cd commands
alias htdocs="cd ~/../../Applications/MAMP/htdocs"

#Rails commands
alias be="bundle exec"
alias rcon="bundle exec rails c"
alias routes="bundle exec rake routes | grep"
alias pdb="bundle exec rake db:test:prepare"
alias rsp="pdb && RAILS_ENV=test rspec --format doc"
alias rgrep="ps aux | grep rspec"

#Sublime
alias subl.="subl ."

#Shut down
alias die="shutdown now"

#Gulp
alias gulpit="gulp && gulp watch"

#DNS
alias hosts="subl /etc/hosts"
alias refresh_dns="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

#AUTROLOAD!
autoload -Uz compinit && compinit
