""
" Maintainer:   PegaS (pegas@pegas.me)
" Version:      1.0.2
" Last Change:  2016-07-13
" Filename:     pegas.vim
""
" References:
"
" http://hcalves.deviantart.com/art/Mustang-Vim-Colorscheme-98974484
" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
" https://material.google.com/style/color.html#color-color-palette
" https://github.com/tyrannicaltoucan/vim-deep-space
""

hi clear
if exists("syntax_on")
  syntax reset
endif

set background=dark

let &t_ZH         = "\e[3m"
let &t_ZR         = "\e[23m"
let t_Co          = 256
let colors_name   = "pegas"

" Colors
let s:none        = ['NONE',      'NONE']

let s:bold        = ['bold',      'bolditalic']
let s:undercurl   = ['underline', 'boldundercurl']
let s:underline   = ['underline', 'underline']
let s:italic      = ['italic',    'italic']

let s:white       = [252, '#d0d0d0']
let s:lightgrey   = [247, '#9e9e9e']
let s:midgrey     = [241, '#606060']
let s:grey        = [237, '#3a3a3a']
let s:darkgrey    = [235, '#262626']
let s:black       = [233, '#121212']

let s:blue        = [67,  '#5f87af']
let s:green       = [113, '#87d75f']
let s:orange      = [172, '#d78700']
let s:pink        = [203, '#ff5f5f']
let s:red         = [167, '#d75f5f']
let s:purple      = [97,  '#875faf']
let s:cyan        = [30,  '#008787']
let s:yellow      = [222, '#ffd787']
let s:brightred   = [203, '#ff5f5f']

function! SetColor(group, fg, bg, ...)
  execute 'hi!' a:group 'ctermfg='.a:fg[0] 'ctermbg='.a:bg[0]
                      \ 'guifg='.a:fg[1]   'guibg='.a:bg[1]
                      \ 'cterm='.(a:0 == 1 ? a:1[0] : 'NONE')
                      \ 'gui='.(a:0 == 1 ? a:1[1] : 'NONE')
endfun
"usage:
"call SetColor('Identifier',      fg color        bg color          attribute)

" Text
call SetColor('Cursor',           s:none,         s:lightgrey)
call SetColor('Normal',           s:white,        s:black)
call SetColor('NonText',          s:brightred,    s:black)
call SetColor('Visual',           s:black,        s:white)

" Basic syntax
call SetColor('Comment',          s:lightgrey,    s:none,           s:italic)
call SetColor('String',           s:yellow,       s:none)
call SetColor('Constant',         s:red,          s:none)
call SetColor('Character',        s:red,          s:none)
call SetColor('Number',           s:red,          s:none)
call SetColor('Boolean',          s:red,          s:none)
call SetColor('Float',            s:red,          s:none)
call SetColor('Identifier',       s:cyan,         s:none)
call SetColor('Function',         s:orange,       s:none)
call SetColor('Statement',        s:blue,         s:none)
call SetColor('Conditional',      s:blue,         s:none)
call SetColor('Repeat',           s:blue,         s:none)
call SetColor('Label',            s:blue,         s:none)
call SetColor('Tag',              s:blue,         s:none)
call SetColor('Todo',             s:white,        s:pink,           s:italic)
call SetColor('Keyword',          s:blue,         s:none)
call SetColor('Type',             s:orange,       s:none)
call SetColor('Error',            s:red,          s:none,           s:bold)
call SetColor('PreProc',          s:purple,       s:none)
call SetColor('Include',          s:purple,       s:none)
call SetColor('Define',           s:purple,       s:none)
call SetColor('Macro',            s:purple,       s:none)
call SetColor('Special',          s:red,          s:none)

" Editor
call SetColor('CursorLine',       s:none,         s:darkgrey)
call SetColor('CursorColumn',     s:none,         s:darkgrey)
call SetColor('ColorColumn',      s:none,         s:darkgrey)
call SetColor('Directory',        s:blue,         s:none)
call SetColor('Folded',           s:grey,         s:black)
call SetColor('FoldColumn',       s:lightgrey,    s:none)
call SetColor('LineNr',           s:midgrey,      s:none)
call SetColor('MatchParen',       s:black,        s:blue,           s:bold)
call SetColor('Pmenu',            s:lightgrey,    s:darkgrey)
call SetColor('PmenuSbar',        s:grey,         s:lightgrey)
call SetColor('PmenuSel',         s:black,        s:green)
call SetColor('PmenuThumb',       s:lightgrey,    s:white)
call SetColor('SpecialKey',       s:pink,         s:none)
call SetColor('StatusLine',       s:green,        s:darkgrey)
call SetColor('StatusLineNC',     s:lightgrey,    s:grey)
call SetColor('Title',            s:white,        s:none,           s:bold)
call SetColor('VertSplit',        s:lightgrey,    s:none)

" Code-specific colors
"hi link puppetOperator Normal
