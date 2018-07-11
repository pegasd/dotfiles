###
#  .zsh/compdef -- Completion settings
##
# zshcompsys(1), zshcompctl(1)
###

autoload -U compinit
compinit -u -d ~/.history/zshcompdump

zstyle ':completion:*:*:*:*:*' menu select

zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Colors
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*' list-colors 'no=00:fi=00:di=33:ln=35:pi=34:so=35:do=35:bd=35:cd=35:or=31:ex=32'
