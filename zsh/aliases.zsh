if [[ "$OS" == 'OSX' ]]
then
  alias ls='ls -G'
  alias ll='ls -alG'
elif [[ "$OS" == 'LINUX' ]]
then
  alias ls='ls --color=auto'
  alias ll='ls -al --color=auto'
fi

alias reload!='. ~/.zshrc && tmux source-file ~/.tmux.conf'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias /='cd /'
alias ~='cd ~'

alias md='mkdir -p'
