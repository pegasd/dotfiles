###
#  .zsh/prompt - ZSH Prompt
##
# zshcontrib(1)
# https://gist.github.com/1712320
###

setopt prompt_subst

# Prompt Colors
CUR_DIR_COLOR="$pr_yellow"

case $(hostname -s) in
  simensis) HOST_COLOR="$pr_green" ;;
  dirus) HOST_COLOR="$pr_yellow" ;;
  adustus) HOST_COLOR="$pr_magenta" ;;
  *) HOST_COLOR="$pr_cyan" ;;
esac

if [ $(whoami) = "root" ]; then
  USER_COLOR="$pr_red"
  PROMPT_COLOR="$pr_red"
else
  USER_COLOR="$HOST_COLOR"
  PROMPT_COLOR="$pr_white"
fi

# vcs_info Colors
VCS_NAME="%{$fg[cyan]%}%s%{$reset_color%}"
VCS_ACTION="%{$fg[red]%}%a%{$reset_color%}"
VCS_PROMPT="%{$fg[cyan]%}:%{$reset_color%}"
VCS_BRANCH="%{$fg[white]%}%b%{$reset_color%}"
VCS_STAGED="%{$pr_lgreen%}✘%{$reset_color%}"
VCS_UNSTAGED="%{$pr_lyellow%}✘%{$reset_color%}"
VCS_UNTRACKED="%{$pr_lred%}✘%{$reset_color%}"
VCS_BRL="%{$fg[cyan]%}(%{$reset_color%}"
VCS_BRR="%{$fg[cyan]%})%{$reset_color%}"

autoload -Uz vcs_info

zstyle ':vcs_info:*' enable hg git svn cvs

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true

zstyle ':vcs_info:*' formats        "${VCS_NAME}${VCS_PROMPT}${VCS_BRL}${VCS_BRANCH}%m${VCS_BRR}%u%c "
zstyle ':vcs_info:*' actionformats  "${VCS_NAME}:${VCS_ACTION}${VCS_PROMPT} $VCS_BRL$VCS_BRANCH%m${VCS_BRR}%u%c "
zstyle ':vcs_info:*' stagedstr      " $VCS_STAGED"
zstyle ':vcs_info:*' unstagedstr    " $VCS_UNSTAGED"

# hg
zstyle ':vcs_info:hg*:*' get-bookmarks  true
zstyle ':vcs_info:hg*:*' get-mq         true
zstyle ':vcs_info:hg*:*' get-unapplied  true
zstyle ':vcs_info:hg*:*' patch-format   "mq(%g):%n/%c %p"
zstyle ':vcs_info:hg*:*' nopatch-format "mq(%g):%n/%c %p"
zstyle ':vcs_info:hg*:*' hgrevformat    "%r"
zstyle ':vcs_info:hg*:*' branchformat   "%b"
# untracked
zstyle ':vcs_info:hg*+set-message:*' hooks hg-untracked
+vi-hg-untracked() {
  if hg status | grep '^?' &> /dev/null; then
    hook_com[staged]+=" $VCS_UNTRACKED"
  fi
}

# git untracked
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
    git status --porcelain | grep '??' &> /dev/null ; then
    hook_com[staged]+=" $VCS_UNTRACKED"
  fi
}

precmd() {
  ((PWDLEN = $COLUMNS - ${#${(%):-%n-%m------(-)}}))
  vcs_info
}

PR_HOST="$HOST_COLOR%m$pr_reset"
PR_USER="$USER_COLOR%n$pr_reset"
PR_PROMPT="$PROMPT_COLOR%#$pr_reset"
PR_RETCODE="%(?.. < ${pr_lred}%?$pr_reset >)"
PR_TIMEDATE="[]"

PROMPT='~>$PR_RETCODE ${PR_USER} @ ${PR_HOST} $CUR_DIR_COLOR%$PWDLEN<...<%~%<<%{$reset_color%}
 $vcs_info_msg_0_$PR_PROMPT '
PROMPT2='(%_) $hcolor>$pr_reset '
RPROMPT=''
