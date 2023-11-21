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

# Ruby
alias rk='time bundle exec rake'
alias be='time bundle exec'
alias bin='bundle install --path ~/.bundle'

# Ansible
alias anplay='time ansible-playbook --diff'

# Update dotfiles
updotfiles()
{
  git -C ~/.dotfiles pull
  rsync -r ~/.dotfiles/ ~ --exclude=.git --exclude=LICENSE --exclude=*.md

  if [ -d ~/.dotfiles-private ]
  then
    git -C ~/.dotfiles-private pull
    rsync -r ~/.dotfiles-private/ ~ --exclude=.git --exclude=LICENSE --exclude=*.md
  fi

  source ~/.zshrc
}

# OS-specific aliases
case $(uname) in
  Darwin)
    alias rmjunk='find . -name .DS_Store -delete 2> /dev/null'
    alias sgrep='sudo ggrep -RE --color=always'
    alias rgrep='ggrep -RE --color=always'
    alias pbud='/usr/libexec/PlistBuddy'
    alias xee='open -a xee³'
    alias brewup='brew upgrade --greedy'
  ;;
  FreeBSD)
    alias sgrep='sudo grep -RE --color=always'
    alias rgrep='grep -RE --color=always'
  ;;
esac
