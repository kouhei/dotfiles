scriptencoding utf-8
" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END
"*****************************************************************************
"" NeoBundle core
"*****************************************************************************

if has('vim_starting')
  set nocompatible               " Be iMproved

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
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"自動補完
"NeoBundle 'Shougo/neocomplcache'
NeoBundle "Shougo/neocomplete"



"ファイルツリー
NeoBundle 'scrooloose/nerdtree'

"ctrl+eでファイルツリー表示
nnoremap <silent><C-e> :NERDTreeToggle<CR>


"とじカッコ自動入力
NeoBundle 'Townk/vim-autoclose'

"ifなどの終了宣言を自動入力
NeoBundleLazy 'tpope/vim-endwise', {
  \ 'autoload' : { 'insert' : 1,}}


" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1






"==========================================
"neocomplete.vim
"==========================================
"use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '¥*ku¥*'
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
let g:neocomplete#keyword_patterns['default'] = '¥h¥w*'
" Plugin key-mappings.
inoremap <expr><C-g>  neocomplete#undo_completion()
inoremap <expr><C-l>  neocomplete#complete_common_string()




call neobundle#end()
NeoBundleCheck


filetype plugin indent on

"my settings
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
colorscheme solarized
let g:solarized_termcolors=256
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
"vimが挿入するインデント('cindent')やシフトオペレータ(>>や<<)で挿入/削除されるインデントの幅を、画面上の見た目で何文字分であるか指定します。自動的に挿入される量、と覚えておくと良いです。
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
"ifなど、特定のキーワードで始まる行の末尾でEnterを押した際には、次行を1段下げてautoindentさせるための設定
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"http://d.hatena.ne.jp/shuji_w6e/20090908/1252418641
"FileTypeがPythonの場合、Ctrl+PでPythonのスクリプトとして実行されます。
" Execute python script C-P 
function! s:ExecPy()
    exe "!" . &ft . " %"
:endfunction
command! Exec call <SID>ExecPy()
autocmd FileType python map <silent> <C-P> :call <SID>ExecPy()<CR>



"http://qiita.com/inodev/items/4f4d5412e65c2564b273
"インサートモードでjjをおすとEsc押したのと同じになる
inoremap <silent> jj <ESC>
" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"set paste

" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
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
"eol: 行の先頭でBSキーを押すことで、前の行の改行文字を削除して前の行と連結できる。これで劇的に便利になる。行の連結方法、知らなかった...。
"start: ctrl+uやctrl+wで入力した文字以外も削除できるようになる。
set backspace=indent,eol,start

"set nowritebackup
"set nobackup
"set noswapfile

set list  " 不可視文字の可視化
set wrap  " 長いテキストの折り返し
set textwidth=0         " 自動的に改行が入るのを無効化
set colorcolumn=80      " その代わり80文字目にラインを入れる

" 前時代的スクリーンベルを無効化
set t_vb=
set novisualbell

" デフォルト不可視文字は美しくないのでUnicodeで綺麗に
"set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

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

" TABにて対応ペアにジャンプ
"nnoremap <Tab> %
"vnoremap <Tab> %


"set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする






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






" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif
