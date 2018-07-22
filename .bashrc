###
#  .bashrc
##
# by PegaS
###

# Colors
Reset='\[\033[0;0m\]'
BoldYellow='\[\033[1;33m\]'
BoldRed='\[\033[1;31m\]'
Red='\[\033[0;31m\]'
Green='\[\033[0;32m\]'
Yellow='\[\033[0;33m\]'
Cyan='\[\033[0;36m\]'

# Options
HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize
shopt -s autocd

# Completion
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
  . /opt/local/etc/profile.d/bash_completion.sh
elif [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi


function set_prompt() {
  local RC=$?
  local PR_LHS="${Cyan}[${Reset}"
  local PR_RHS="${Cyan}]${Reset}"
  local HOST=$(hostname -f)
  local ME=$(whoami)
  local ST_CLR="${Green}"
  local UNST_CLR="${BoldYellow}"
  local UNTR_CLR="${BoldRed}"
  local VCS_NAME=''
  local PR_ST=''
  local PR_UNST=''
  local PR_UNTR=''

  if [ $RC -ne 0 ]; then
    exit_status="< $BoldRed$RC$Reset > "
  else
    exit_status=''
  fi

  [ "$ME" = "root" ] && ME="${BoldRed}$ME${Reset}" || ME="${Green}$ME${Reset}"
  if [[ "$HOST" =~ iponweb.net$ ]]; then
    local PROJ=$(echo $HOST | cut -d. -f2 | tr '[:lower:]' '[:upper:]')
    whereami="$Reset[ $ME @ ${BoldYellow}$PROJ$Reset ] ${Cyan}${HOST}${Reset}"
  else
    whereami="$ME @ ${Green}$(hostname -s)${Reset}"
  fi

  __hg_prompt() {
    local HG_BRANCH=$( hg branch 2> /dev/null )
    [ -z "$HG_BRANCH" ] && return

    local HGST=$( hg status 2> /dev/null )
    [ -n "`echo "$HGST" | grep '^A'`" ] && PR_ST="${ST_CLR}A${Reset} "
    [ -n "`echo "$HGST" | grep '^M'`" ] && PR_UNST="${UNST_CLR}M${Reset} "
    [ -n "`echo "$HGST" | grep '^?'`" ] && PR_UNTR="${UNTR_CLR}?${Reset} "
    [ -n "`echo "$HGST" | grep '^!'`" ] && PR_UNTR="${PR_UNTR}${UNTR_CLR}!${Reset} "
    [ -n "`echo "$HGST" | grep '^R'`" ] && PR_UNTR="${PR_UNTR}${UNTR_CLR}R${Reset} "
    VCS_NAME='hg'
    VCS_STATE="${PR_ST}${PR_UNST}${PR_UNTR}"
    VCS_INFO="${HG_BRANCH}"
  }

  __cvs_prompt() {
    [ ! -d CVS ] && return

    VCS_NAME='cvs'
    VCS_INFO="`cat CVS/Repository`"
  }

  __git_prompt() {
    [ -z "`git rev-parse --is-inside-work-tree 2> /dev/null`" ] && return

    GIT_BRANCH="`git branch 2> /dev/null | grep '^*' | awk '{print $2}'`"

    GST="`git status --porcelain 2> /dev/null`"
    [ "`echo "$GST" | grep '^A'`" != "" ] && PR_ST="${ST_CLR}A${Reset} "
    [ "`echo "$GST" | grep '^ M'`" != "" ] && PR_UNST="${UNST_CLR}M${Reset} "
    [ "`echo "$GST" | grep '^??'`" != "" ] && PR_UNTR="${UNTR_CLR}?${Reset} "
    VCS_NAME='git'
    VCS_STATE="${PR_ST}${PR_UNST}${PR_UNTR}"
    VCS_INFO="${GIT_BRANCH}"
  }

  __hg_prompt
  __git_prompt
  __cvs_prompt

  if [[ -n "$VCS_NAME" ]]; then
    local PR="${Cyan}$VCS_NAME>${Reset}"
    [[ -n "$VCS_STATE" ]] && local PR_STATUS=" ${PR_LHS} ${VCS_STATE}${PR_RHS}"
    local PR_INFO="${PR_LHS}${VCS_INFO}${PR_RHS}"
    vcs_prompt="${PR} ${PR_INFO}${PR_STATUS} "
  else
    vcs_prompt=''
  fi

  PS1="${exit_status}${PR_LHS}\t${PR_RHS} ${whereami} ${Yellow}\w${Reset}\n ${vcs_prompt}\$ "
}

PROMPT_COMMAND=set_prompt
PS2='> '

# Aliases
case $(uname) in
  Darwin|*BSD)
    alias ls="ls -FG"
    alias la="ls -FGA"
    alias l1="ls -FG1"
    alias ll="ls -FGAl"
    export LSCOLORS='dxfxexexcxexexbxhxhxdx'
    ;;
  Linux)
    alias ls="ls --color=always -F"
    alias la="ls --color=always -FA"
    alias l1="ls --color=always -F1"
    alias ll="ls --color=always -Fal"
    export LS_COLORS='no=00:fi=00:di=33:ln=35:pi=34:so=35:do=35:bd=35:cd=35:or=31:ex=32'
    ;;
esac

alias v='vim'
alias sv='sudo -E vim'

# UTF-8
export LC_ALL='en_US.UTF-8'
