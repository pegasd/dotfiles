###
#  .zsh/keybind -- ZSH key bindings
###

# vi-style of command-line editing
bindkey -v

# History search
autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Key bindings
#bindkey '\e[A'  history-beginning-search-backward   # up
#bindkey '\e[B'  history-beginning-search-forward    # down
bindkey '\e[A'  up-line-or-beginning-search         # up
bindkey '\e[B'  down-line-or-beginning-search       # down
bindkey "\e[1~" beginning-of-line                   # home
bindkey "\e[4~" end-of-line                         # end
bindkey "\e[3~" delete-char                         # delete
bindkey '^R'    history-incremental-search-backward # ^r
