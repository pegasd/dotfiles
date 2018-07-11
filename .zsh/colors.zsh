###
#  .zsh/colors -- ZSH color variables
##
# with compliments to Phil! Gregory:
# http://aperiodic.net/phil/prompt/
# changed some stuff around, since
# vt100 terminals crap out if you use
# terminfo (iTerm was the problem for me)
###

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
