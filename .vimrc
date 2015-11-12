
scriptencoding utf-8


"*****************************************************************************
"" NeoBundle core
"*****************************************************************************
scriptencoding utf-8

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')

let g:vim_bootstrap_langs = "javascript,ruby,python,c,html"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"

  " Run shell script if exist on custom select language
    
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
"beginとendの間にインストールするものを書く
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'powerline/powerline'


call neobundle#end()
NeoBundleCheck
filetype plugin indent on




"ここから自分の設定
syntax on

syntax enable

" colorschemeの設定前に書くこと
" line番号の色を設定
" ~/show256colors.plで色に対応する番号がわかる
" perl show256colors.pl で実行
autocmd ColorScheme * highlight LineNr ctermfg=153

set background=dark
"colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1
"colorscheme hybrid
"colorscheme darkblue
"colorscheme elflord
"colorscheme desert "good
"colorschem pablo "good
"colorscheme murphy
"colorscheme evening
"colorscheme slate
"colorscheme torte
colorscheme solarized
let g:solarized_termcolors=256
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

