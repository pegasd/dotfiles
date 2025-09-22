###
#  .zsh/colors -- ZSH color variables
##
# with compliments to Phil! Gregory:
# http://aperiodic.net/phil/prompt/
# changed some stuff around, since
# vt100 terminals crap out if you use
# terminfo (iTerm was the problem for me)
###

# ls colors
export LS_COLORS='no=00:fi=00:di=33:ln=35:pi=34:so=35:do=35:bd=35:cd=35:or=31:ex=32'
export LSCOLORS='dxfxexexcxexexbxhxhxdx'

# Load color arrays ($fg and $bg)
autoload colors
colors

# Set variables
for color in black red green yellow blue magenta cyan white; do
  eval $color='$fg[$color]'
  eval b$color='$bg[$color]'
  eval l$color='[1m$fg[$color]'
  eval pr_$color='%{$fg[$color]%}'
  eval pr_l$color='%{[1m$fg[$color]%}'
done

pr_reset="%{$reset_color%}"
