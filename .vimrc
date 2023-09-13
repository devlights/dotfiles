" https://gist.github.com/devlights/2ff36954159d866ecdd4928cd329092b
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
" 画面のカラースキーマ
colorscheme desert

"---------------------------------------------------------------------------
" ファイル操作に関する設定:
"
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup
" スワップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set noswapfile
" シンタックスハイライト
syntax on

"---------------------------------------------------------------------------
" netrw:
"   - https://vim-jp.org/vimdoc-ja/pi_netrw.html#netrw-cd
"
let g:netrw_keepdir=0

" vim-plug
"
" see: https://github.com/junegunn/vim-plug#installation
"call plug#begin()
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'vim-jp/vimdoc-ja'
"Plug 'ctrlpvim/ctrlp.vim'
"call plug#end()

" https://github.com/vim-jp/vimdoc-ja/wiki
"set helplang=ja,en

" vim-go
"
" - https://cs.opensource.google/go/x/tools/+/master:gopls/doc/vim.md
" - https://github.com/fatih/vim-go/wiki/Tutorial
"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'
"let g:go_rename_command='gopls'
