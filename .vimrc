"""
"  .vimrc
"""

" General
set nobackup
set writebackup
set clipboard=unnamed
set backspace=indent,eol,start
set esckeys
set incsearch
set matchtime=7
set matchpairs=(:),[:],{:},<:>
set noerrorbells
set number
set novisualbell
set report=0
set showmatch
set modeline
set smartcase
set ttyfast
set nohlsearch
set mouse=a
set list
set listchars=tab:→·,trail:·,nbsp:¬
" set listchars=tab:>_,trail:_,nbsp:% " Lame ASCII-safe version

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,latin1
set termencoding=utf-8

" Status line
set laststatus=2
set showcmd
set showmode
set ruler
set statusline=[%n]\ -=PegaS=-\ %F\ \ Format=%{&ff}\ Type=%Y\ \ %r\ %1*%m%*%w%=%(Line:\ %l%)\ Column:\ %5(%c%V/%{strlen(getline(line('.')))}%)\ %4(%)%p%%

" Spelling
set nospell
set spellsuggest=double
set spelllang=en_us

" Syntax highlighting
syntax enable
colorscheme pegas

" RU <-> Dvorak
set langmap="й',у.,кp,еy,нf,гg,шc,щr,зl,х/,ъ=,фa,ыo,вe,аu,пi,рd,оh,лt,дn,э-,чq,сj,мk,иx,тb,ьm,бw,юv,ё`,Я:,ГG"

" Key mappings
map ,on   :windo set number!<CR>
map ,or   :windo set relativenumber!<CR>
map ,op   :windo set paste!<CR>
map ,oh   :windo set hlsearch!<CR>
map ,ol   :windo set list!<CR>
map ,ot   :windo set expandtab!<CR>

map ,oi2  :windo set tabstop=2 shiftwidth=2 softtabstop=2<CR>
map ,oi4  :windo set tabstop=4 shiftwidth=4 softtabstop=4<CR>
map ,oi8  :windo set tabstop=8 shiftwidth=8 softtabstop=8<CR>

map ,te   :Tab/=<CR>
map ,tr   :Tab/=><CR>
map ,tj   :Tab/:/r0\zs<CR>

" Indentation
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set linebreak
set colorcolumn=140

" File Types
autocmd BufNewFile,BufRead *.sh,*.bash set filetype=sh
autocmd BufNewFile,BufRead *.zsh,~/.zsh/* set filetype=zsh
autocmd BufNewFile,BufRead *.pp,*.epp set filetype=puppet
autocmd BufNewFile,BufRead *.swift set filetype=swift
autocmd BufNewFile,BufRead Jenkinsfile set filetype=groovy
autocmd BufNewFile,BufRead Podfile,Puppetfile,Brewfile set filetype=ruby
autocmd FileType text setlocal spell
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 colorcolumn=80
autocmd FileType groovy setlocal tabstop=4 shiftwidth=4 softtabstop=4

" Pathogen
execute pathogen#infect()

" Syntastic
" let g:syntastic_check_on_open = 1
" let g:syntastic_aggregate_errors = 1
" let g:syntastic_puppet_puppetlint_args = "--no-140chars-check"

" Hello / Goodbye
autocmd VimEnter * echo "Welcome back, PegaS!"
autocmd VimLeave * echo "Peace! \/"

" History
set history=500
set undolevels=500
set viminfo='100,<500,:10000,@10000,/10000,s1024,f1,h,r/tmp,n~/.history/viminfo
