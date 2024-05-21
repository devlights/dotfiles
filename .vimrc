" https://gist.github.com/devlights/2ff36954159d866ecdd4928cd329092b
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------
" 全体設定:
"
" VI互換モードをOFF
set nocompatible
" シンタックスハイライト
syntax on
" ファイルタイプ検出をON
filetype on
" ファイルタイプに応じたプラグインのロードをON
filetype plugin on
" ファイルタイプに応じたインデント設定のロードをON
filetype indent on
" 対応する括弧にマッチするように
runtime macros/matchit.vim

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
" インクリメンタルサーチ
set incsearch
" 検索ハイライト
set hlsearch
" 検索時の正規表現指定を行いやすいように \v をデフォルトで指定するようにしておく
nmap / /\v

"---------------------------------------------------------------------------
" 編集に関する設定:
"
" タブの画面上での幅
set tabstop=4
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4
" 自動インデントでずれる幅
set shiftwidth=4
" タブをスペースに展開する/ しない (expandtab:展開する)
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" エンコーディングと改行コード関連
set encoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp
set fileformats=unix,dos,mac
" 常に現在のディレクトリに相対的になるように
set path+=**
" タグファイルの設定
" :help file-searching
set tags=./tags;


"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" タイトルを表示する
set title
" 行番号を表示 (nonumber:非表示)
set number
" 相対行番号形式にする
set relativenumber
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" モードを表示する
set showmode
" ベル鳴らさない
set belloff=all

"---------------------------------------------------------------------------
" ファイル操作に関する設定:
"
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup
" スワップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set noswapfile

"---------------------------------------------------------------------------
" マウスに関する設定:
"
set mouse=a
set clipboard+=autoselect
set clipboard+=unnamed
set clipboard+=unnamedplus

"---------------------------------------------------------------------------
" Windows
"
" Change terminal shell (Windows)
"   - https://vi.stackexchange.com/a/14934
if has("win32")
	set shell=pwsh
endif

"---------------------------------------------------------------------------
" netrw:
"   - https://vim-jp.org/vimdoc-ja/pi_netrw.html#netrw-cd
"
let g:netrw_keepdir=0

" vim-plug
"
" see: https://github.com/junegunn/vim-plug#installation
call plug#begin()
Plug 'vim-jp/vimdoc-ja'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'glidenote/memolist.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

" https://github.com/vim-jp/vimdoc-ja/wiki
set helplang=ja,en

" https://github.com/catppuccin/vim
let g:lightline = {'colorscheme': 'catppuccin_macchiato'}
