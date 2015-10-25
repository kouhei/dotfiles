scriptencoding utf-8
syntax on

" colorschemeの設定前に書くこと
" ~/show256colors.plで色に対応する番号がわかる
" perl show256colors.pl で実行
autocmd ColorScheme * highlight LineNr ctermfg=153

set background=dark
"colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1
colorscheme hybrid
"colorscheme darkblue
"colorscheme elflord
"colorscheme desert "good
"colorschem pablo "good
"colorscheme murphy
"colorscheme evening
"colorscheme slate
"colorscheme torte
set showcmd
set ignorecase
set smartcase
set incsearch
set autowrite
set hidden

set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=8
set sidescrolloff=16
set sidescroll=1
set hlsearch

set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

set number
set display=lastline
set pumheight=10
set showmatch
set matchtime=1

