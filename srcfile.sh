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
alias rsp="be rspec --format doc"
alias rgrep="ps aux | grep rspec"

#Docker commands
alias dicker="docker"
alias dicker-compose="docker-compose"
alias cocker="docker"
alias cocker-compose="docker-compose"

#Git commands
alias gi="git"
alias gt="git"

#Sublime
alias subl.="subl ."

#Shut down
alias die="shutdown now"

#Gulp
alias gulpit="gulp && gulp watch"

#Ruby stuff
alias _irb="irb"
alias irb="pry"

#DNS
alias hosts="subl /etc/hosts"
alias refresh_dns="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

#Tools
alias devserve="ruby $COMMANDS_PATH/apps/php_serve.rb"

alias rb="ruby $COMMANDS_PATH/apps/rb.rb"
alias escape_spaces="rb -l \"gsub(' ', '\ ')\""

alias swap="$COMMANDS_PATH/apps/swap.sh"

alias prettyping="$COMMANDS_PATH/apps/prettyping --nolegend"

#AUTROLOAD!
autoload -Uz compinit && compinit
