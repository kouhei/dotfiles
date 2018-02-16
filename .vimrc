" 文字コードの指定
set enc=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
scriptencoding utf-8
" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END
"*****************************************************************************
"" NeoBundle core
"*****************************************************************************

if has('vim_starting')
  set nocompatible

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')

let g:vim_bootstrap_langs = "javascript,ruby,python,c,html"
let g:vim_bootstrap_editor = "vim"   " nvim or vim

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
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'

"自動補完
NeoBundle "Shougo/neocomplete"

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


NeoBundle 'davidhalter/jedi-vim'



NeoBundleLazy 'vim-scripts/javacomplete', {
\   'build': {
\       'cygwin': 'javac autoload/Reflection.java',
\       'mac': 'javac autoload/Reflection.java',
\       'unix': 'javac autoload/Reflection.java',
\   },
\}

"ファイルツリー
NeoBundle 'scrooloose/nerdtree'
"ctrl+eでファイルツリー表示
nnoremap <silent><C-e> :NERDTreeToggle<CR>


NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'solarized'
      \ }



NeoBundle 'Shougo/vinarise'

"MarkDownプレビュー"
"NeoBundle 'miyakogi/livemark.vim'

"Nimの補完"
"NeoBundle 'zah/nimrod.vim'

"とじカッコ自動入力
NeoBundle 'Townk/vim-autoclose'

"ifなどの終了宣言を自動入力
"NeoBundleLazy 'tpope/vim-endwise', {
"  \ 'autoload' : { 'insert' : 1,}}


" インデントに色を付ける
NeoBundle 'nathanaelkane/vim-indent-guides'
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
       autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=245
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=240

"==========================================
"neocomplete.vim
"==========================================
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
"use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Plugin key-mappings.
inoremap <expr><C-g>  neocomplete#undo_completion()
inoremap <expr><C-l>  neocomplete#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
"inoremap <expr><C-e>  neocomplete#cancel_popup()

" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" autocmd FileType python setlocal omnifunc=pythoncomplete#Complet
" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"       'default' : ''
"       'vimshell' : $HOME.'/.vimshell_hist',
"       'scheme' : $HOME.'/.gosh_completions'
"       }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

call neobundle#end()
NeoBundleCheck


filetype plugin indent on
let g:pydiction_location = '$HOME/.vim/after/ftplugin/pydiction/complete-dict'

"my settings
syntax enable

" colorschemeの設定前に書くこと
" line番号の色を設定
" ~/show256colors.plで色に対応する番号がわかる
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
"set relativenumber "現在行からの相対的な行数を表示
set display=lastline
set pumheight=10
set showmatch "対応するカッコをハイライトする時間
set matchtime=2 "対応するカッコをハイライトする時間(秒)

"http://blog.papix.net/entry/2012/12/14/042937
" カーソルを自動的に()の中へ
"imap {} {}<Left>
"imap [] []<Left>
"imap () ()<Left>
"imap \"\" \"\"<Left>
"imap '' ''<Left>
"imap <> <><Left>

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
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>

"set paste

" Powerline
set laststatus=2
set showtabline=2
set noshowmode

" Powerlineの設定
"let g:Powerline_symbols = 'fancy'
" "文字化けするならこっち使う
"let g:Powerline_symbols = 'compatible'
"set t_Co=256

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


"t1,t2....などでタブ移動
"参考:http://qiita.com/wadako111/items/755e753677dd72d8036d
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ


set backupskip=/tmp/*,/private/tmp/*

" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif
