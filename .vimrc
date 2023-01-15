" 文字コードの指定
set helplang=ja,en
set enc=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
scriptencoding utf-8
set nocompatible

let g:vim_bootstrap_langs = "javascript,ruby,python,c,html"


call plug#begin('~/.vim/plugged')

"color scheme
Plug 'joshdick/onedark.vim'
Plug 'w0ng/vim-hybrid'
Plug 'atelierbram/Base2Tone-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'jdkanani/vim-material-theme'

Plug 'sheerun/vim-polyglot'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
"ctrl+eでファイルツリー表示
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"自動補完
"Plug 'Shougo/neocomplete'
" 起動時に有効化
"let g:neocomplete#enable_at_startup = 1
" 大文字が入力されるまで大文字小文字の区別を無視する
"let g:neocomplete#enable_smart_case = 1
" ポップアップメニューで表示される候補の数
"let g:neocomplete#max_list = 20
" シンタックスをキャッシュするときの最小文字長
"let g:neocomplete#sources#syntax#min_keyword_length = 3
" 補完を表示する最小文字数
"let g:neocomplete#auto_completion_start_length = 2
"let g:neocomplete#max_keyword_width = 10000

"git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"toggle comment
Plug 'tyru/caw.vim'
" 行の最初の文字の前にコメント文字をトグル
nmap <C-s> <Plug>(caw:hatpos:toggle.nx)
vmap <C/> <Plug>(caw:hatpos:toggle.nx)

"sublime like nulti cursor
Plug 'terryma/vim-multiple-cursors'
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

Plug 'sudar/vim-arduino-syntax'

" settings for react
" https://qiita.com/atsumo/items/cdae74a8920320693696
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers=['jsxhint']

"function! Multiple_cursors_after()
"  if exists(':NeoCompleteUnlock')==2
"    exe 'NeoCompleteUnlock'
"  endif
"endfunction

"python補完
"Plug 'davidhalter/jedi-vim'
"autocmd FileType python setlocal completeopt-=preview
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-n>"

Plug 'tweekmonster/braceless.vim'
autocmd FileType python BracelessEnable +fold +highlight

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
autocmd ColorScheme * highlight LineNr ctermfg=153

set background=dark
"colorscheme hybrid

"colorscheme material-theme

" Base2Tone Dark
"colorscheme Base2Tone_EveningDark
" or any of the other schemes:
" colorscheme Base2Tone_MorningDark
"!colorscheme Base2Tone_SeaDark
" colorscheme Base2Tone_SpaceDark
" colorscheme Base2Tone_EarthDark
"!colorscheme Base2Tone_ForestDark
" colorscheme Base2Tone_DesertDark
" colorscheme Base2Tone_LakeDark
" colorscheme Base2Tone_MeadowDark
"!colorscheme Base2Tone_DrawbridgeDark
" colorscheme Base2Tone_PoolDark
" colorscheme Base2Tone_HeathDark
" colorscheme Base2Tone_CaveDark
 colorscheme onedark

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

"C-bでバックスペース
imap <C-b> <BS>

nnoremap s <Nop>
nnoremap s> 5<C-w>>
nnoremap s< 5<C-w><
nnoremap s+ 5<C-w>+
nnoremap s- 5<C-w>-


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

" Using the mouse on a terminal.
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632') " I couldn't use has('mouse_sgr') :-(
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
endif

set backupskip=/tmp/*,/private/tmp/*

" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif
