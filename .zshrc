###
#  .zshrc - Main ZSH configuration file
##
# zshall(1)
# github.com/robbyrussell/oh-my-zsh
###

# History
HISTSIZE=4096
SAVEHIST=4096
HISTFILE=~/.history/zshhistory

# Various PATHs
# Don't _ever_ do this: path=($path .)
cdpath=(~)
fpath=($fpath ~/.zsh/functions)
path=()
# ~/.gem/ruby/*/bin
for PDIR in ~/bin \
  /opt/local/bin  /usr/local/bin  /bin  /usr/bin  \
  /opt/local/sbin /usr/local/sbin /sbin /usr/sbin \
  /opt/puppetlabs/pdk/bin /opt/puppetlabs/bin
do
  [ -d $PDIR ] && path=($path $PDIR)
done

# Additional files
for ZSH_EXTRA_CONFIG in $(ls ~/.zsh/*.zsh); do
  . ${ZSH_EXTRA_CONFIG}
done

# Options
setopt auto_cd              # cd even if 'cd' is omitted
setopt auto_pushd           # push directories onto a stack
setopt bad_pattern          # complain when pattern is incorrectly written
setopt cdable_vars          # cd if dir exists with var name provided
setopt extended_glob        # extended patterns
setopt extended_history     # put more info into history file
setopt hist_ignore_all_dups # don't put dups into history
setopt hist_ignore_space    # ignore history items starting with ' '
setopt hist_no_store        # don't store "history" and "fc"
setopt multios              # output can be redirected multiple times
setopt prompt_sp            # output with no <CR> correctly displayed
setopt prompt_subst         # substitute variables inside prompt
setopt pushd_ignore_dups    # don't put dups onto the dir stack
setopt rm_star_silent       # don't complain at rm *
setopt no__correct          # don't correct command spelling errors
setopt no__nomatch          # don't complain about no match (e.g. *)
setopt no__beep             # don't beep

# Format of the 'time' command output
# export TIMEFORMAT=$'\n    \e[32m%U \e[muser \e[32m%S \e[msystem \e[32m%P \e[mcpu \e[32m%E \e[mtotal\n'
# export TIMEFMT=$'\n  [ \e[33m%J\e[m ]   \e[32m%U \e[muser \e[32m%S \e[msystem \e[32m%P \e[mcpu \e[32m%E \e[mtotal\n'
export TIMEFMT=$'   [ \e[33m%J\e[m ]   \e[32m%U \e[muser \e[32m%S \e[msystem \e[32m%P \e[mcpu \e[32m%E \e[mtotal'

# Environment
[[ -x $(which most) ]] && PAGER='most -cw' || PAGER=less
export PAGER
export EDITOR=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
umask 002

##
# Various dev environment settings
##

# google-cloud-sdk
GCLOUD_SDK_PATH='/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk'
[ -f "${GCLOUD_SDK_PATH}/path.zsh.inc" ] && . "${GCLOUD_SDK_PATH}/path.zsh.inc"
[ -f "${GCLOUD_SDK_PATH}/completion.zsh.inc" ] && . "${GCLOUD_SDK_PATH}/completion.zsh.inc"

# rvm
[ -s ~/.rvm/scripts/rvm ] && . ~/.rvm/scripts/rvm

# Go
export GOPATH=~/Developer/Go

# Exit to prevent execution of unreviewed appended code
return 0
