" 文字コードの指定
set helplang=ja,en
set enc=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
scriptencoding utf-8
set nocompatible

let g:vim_bootstrap_langs = "javascript,ruby,python,c,html"


call plug#begin('~/.vim/plugged')
"beginとendの間にインストールするものを書く
Plug 'w0ng/vim-hybrid'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
"ctrl+eでファイルツリー表示
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"自動補完
Plug 'Shougo/neocomplete'

"git
Plug 'tpope/vim-fugitive'

"sublime like nulti cursor
Plug 'terryma/vim-multiple-cursors'
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

Plug 'davidhalter/jedi-vim'
Plug 'Shougo/vinarise'

"とじカッコ自動入力
Plug 'Townk/vim-autoclose'

Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'solarized'
      \ }



" インデントに色を付ける
Plug 'nathanaelkane/vim-indent-guides'
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
       autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=245
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=240

filetype plugin indent on
let g:pydiction_location = '$HOME/.vim/after/ftplugin/pydiction/complete-dict'


Plug 'vim-scripts/javacomplete', {
\   'build': {
\       'cygwin': 'javac autoload/Reflection.java',
\       'mac': 'javac autoload/Reflection.java',
\       'unix': 'javac autoload/Reflection.java',
\   },
\}



Plug 'junegunn/goyo.vim'


call plug#end()

"NeoBundle 'altercation/vim-colors-solarized'





"" インデントに色を付ける
"NeoBundle 'nathanaelkane/vim-indent-guides'
"" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 1
"let g:indent_guides_guide_size = 1
"let g:indent_guides_auto_colors = 0
"       autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=245
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=240


"my settings
syntax enable

" colorschemeの設定前に書くこと
" line番号の色を設定
"autocmd ColorScheme * highlight LineNr ctermfg=153

set background=dark
colorscheme hybrid
"colorscheme solarized
"let g:solarized_termcolors=256
"colorscheme hybrid_material
"カーソルのある行をハイライト
set cursorline
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

"タブ入力を空白文字に置き換える
set expandtab
"タブ文字を何文字分に展開するか
set tabstop=4
"vimが挿入するインデント('cindent')やシフトオペレータ(>>や<<)で挿入/削除されるインデントの幅を、
"画面上の見た目で何文字分であるか指定します。自動的に挿入される量、と覚えておくと良いです。
set shiftwidth=2 "cindentやautoindent時に挿入されるタブの幅を決定
set autoindent
set smartindent

set number
set display=lastline
set pumheight=10
set showmatch "対応するカッコをハイライトする時間
set matchtime=2 "対応するカッコをハイライトする時間(秒)

"コマンドライン補完するとき候補を表示する
set wildmenu

"http://d.hatena.ne.jp/over80/20090305/1236264851
"ifなど、特定のキーワードで始まる行の末尾でEnterを押した際には、
"次行を1段下げてautoindentさせるための設定
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

""""
"python settings
""""
"シンタックスハイライトに追加
if version < 600
  syntax clear
elseif exists('b:current_after_syntax')
  finish
endif

" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim

syn match pythonOperator "\(+\|=\|-\|\^\|\*\)"
syn match pythonDelimiter "\(,\|\.\|:\)"
syn keyword pythonSpecialWord self

hi link pythonSpecialWord    Special
hi link pythonDelimiter      Special

let b:current_after_syntax = 'python'

let &cpo = s:cpo_save
unlet s:cpo_save



""""""""""java setting
let g:java_highlight_all=1
let g:java_highlight_debug=1
let g:java_allow_cpp_keywords=1
let g:java_space_errors=1
let g:java_highlight_functions=1



augroup BinaryXXD
	autocmd!
	autocmd BufReadPre  *.bin let &binary =1
	autocmd BufReadPost * if &binary | Vinarise
	autocmd BufWritePre * if &binary | Vinarise | endif
	autocmd BufWritePost * if &binary | Vinarise 
augroup END

"http://qiita.com/inodev/items/4f4d5412e65c2564b273
"インサートモードでjjをおすとEsc押したのと同じになる
inoremap <silent> jj <ESC>
inoremap <silent> kk <ESC>
inoremap <silent> hh <ESC>
" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>


" Powerline
set laststatus=2
set showtabline=2
set noshowmode

set clipboard=unnamed,autoselect


"http://lambdalisue.hatenablog.com/entry/2013/06/23/071344参考

" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
" '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set shiftround
set infercase           " 補完時に大文字小文字を区別しない
set switchbuf=useopen
" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>

" バックスペースでなんでも消せるようにする
"indent: オートインデントの空白文字をBSキーで削除できるようになる。
"eol: 行の先頭でBSキーを押すことで、前の行の改行文字を削除して前の行と連結できる
"start: ctrl+uやctrl+wで入力した文字以外も削除できるようになる。
set backspace=indent,eol,start

set list  " 不可視文字の可視化
set wrap  " 長いテキストの折り返し
set textwidth=0  "自動的に改行が入るのを無効化
set colorcolumn=80  "その代わり80文字目にラインを入れる

" スクリーンベルを無効化
set t_vb=

"キー設定"
" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

"全角スペースを可視化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" vを二回で行末まで選択
vnoremap v $h


set backupskip=/tmp/*,/private/tmp/*

" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif
