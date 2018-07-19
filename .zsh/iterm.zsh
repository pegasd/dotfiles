###
#  .zsh/iterm.zsh -- iTerm-specific Aliases
##
# https://iterm2.com/documentation-escape-codes.html
###

[[ -z "$ITERM_SESSION_ID" ]] && return

tab-color()
{
  if [ $# != 3 ]; then
    echo 'Usage: tab-color <red> <green> <blue> # Each color must in be 0-255 range'
    return 1
  fi

  echo -en "\033]6;1;bg;red;brightness;${1}\a"
  echo -en "\033]6;1;bg;green;brightness;${2}\a"
  echo -en "\033]6;1;bg;blue;brightness;${3}\a"
}

alias tc-blue='tab-color 25 100 150'
alias tc-green='tab-color 15 120 50'
alias tc-red='tab-color 150 25 25'
alias tc-gray='tab-color 170 170 170'
alias tc-yellow='tab-color 255 255 50'
