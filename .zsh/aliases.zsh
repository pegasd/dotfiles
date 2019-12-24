###
#  .zsh/aliases -- ZSH Aliases
##
# zsh(1), zshmisc(1)
###

# Global aliases
alias -g TN='> /dev/null 2>&1'
alias -g TNB='> /dev/null 2>&1 &'
alias -g ETN='2> /dev/null'
alias -g A='| awk'
alias -g T='| tail -n 15'
alias -g G='| egrep'
alias -g H='| head -n 15'
alias -g L='| less'

# Aliases
if test ls --color 2> /dev/null; then
  export LS_COLORS='no=00:fi=00:di=33:ln=35:pi=34:so=35:do=35:bd=35:cd=35:or=31:ex=32'
  LS='ls --color -F'
else
  export LSCOLORS='dxfxexexcxexexbxhxhxdx'
  LS='ls -G -F'
fi

alias ls="${LS}"
alias l="${LS} -l"
alias la="${LS} -A"
alias l1="${LS} -1"
alias ll="${LS} -la"

alias g='git'
alias v='vim'
alias sv='sudo vim'
alias sgrep='ggrep -RE --color=always'
alias rmjunk='find . -name ".DS_Store" -delete 2> /dev/null'

# Ruby
alias rk='time bundle exec rake'
alias be='time bundle exec'
alias bin='bundle install --path ~/.bundle'

# Ansible
alias anplay='time ansible-playbook --diff'

# macOS
alias pbud='/usr/libexec/PlistBuddy'
alias xee='open -a xee³'
alias brewup='brew upgrade; brew cask upgrade $(brew cask outdated --greedy)'
