set nocompatible
filetype plugin indent on
syntax on
runtime macros/matchit.vim

let &t_SI = "\e[5 q"   " カーソル形状をInsertモードで点滅I字型にする
let &t_SR = "\e[4 q"   " カーソル形状をReplaceモードで下線にする
let &t_EI = "\e[6 q"   " カーソル形状をノーマル/コマンドモードで非点滅I字型にする

set encoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp
set fileformats=unix,dos,mac
set belloff=all

set number
set relativenumber
set ruler
set showcmd
set showmode
set showmatch
set laststatus=2
set background=dark
set autoread
set nocursorline
set nowrap

set nobackup
set noswapfile

set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan
set magic
nmap / /\v

set nolist
set autoindent

set tabstop=4
set shiftwidth=4
set noexpandtab

set mouse=a
set clipboard+=autoselect
set clipboard+=unnamed
set clipboard+=unnamedplus

set path+=**

" :help file-searching
set tags=./tags;

" Change terminal shell (Windows)
"   - https://vi.stackexchange.com/a/14934
if has("win32")
"	set shell=nu
	set shell=cmd
endif


" vim-plug
"
" see: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
"let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
"if empty(glob(data_dir . '/autoload/plug.vim'))
"  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

" see: https://github.com/junegunn/vim-plug#installation
call plug#begin()
Plug 'vim-jp/vimdoc-ja'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'ghifarit53/tokyonight-vim'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'glidenote/memolist.vim'
Plug 'preservim/nerdtree'
Plug 'chrisbra/csv.vim'
Plug 'dkprice/vim-easygrep'
Plug 'mattn/vim-maketable'
Plug 'terryma/vim-expand-region'
Plug 'unblevable/quick-scope'
Plug 'preservim/nerdcommenter'
Plug 'fidian/hexmode'
Plug 'editorconfig/editorconfig-vim'
Plug 'kshenoy/vim-signature'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

" https://github.com/vim-jp/vimdoc-ja/wiki
set helplang=ja,en

" https://github.com/catppuccin/vim
"let g:lightline = {'colorscheme': 'dracula'}
"let g:lightline = {'colorscheme': 'catppuccin_latte'}
"let g:lightline = {'colorscheme': 'catppuccin_frappe'}
"let g:lightline = {'colorscheme': 'catppuccin_macchiato'}
let g:lightline = {'colorscheme': 'catppuccin_mocha'}
"let g:lightline = {'colorscheme': 'tokyonight'}

" NERDTree
"
" https://github.com/oouchida/vimrc/blob/master/vim_conf/nerd_tree.vim
" ツリーを表示するカレントディレクトリの変更を行うか
"    0 : 行わない、1 : 変更を行えるようにする、2 : 自動的に変更する
"    初期値0
let g:NERDTreeChDirMode=1

" 表示を無視するファイル設定する。
"    初期値 ['\~$']
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']

" 隠しファイルを表示設定
"    0 または 1
"    初期値0: 表示しない
let g:NERDTreeShowHidden=1

" ツリーの幅
"    初期値31
let g:NERDTreeWinSize=45

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" マッピング
" 
""""""""""""""""""
" NERDTree
""""""""""""""""""
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

""""""""""""""""""
" fzf
""""""""""""""""""
nnoremap <C-p> :Files<CR>
nnoremap <C-c> :Rg<Space>

""""""""""""""""""
" LSP
"
" - LspDefinition                  : シンボルの定義元へジャンプ
" - LspTypeDefinition              : 型定義へジャンプ
" - LspImplementation              : 実装箇所へのジャンプ
" - LspReferences                  : シンボル参照元の一覧表示
" - LspRename                      : シンボル名のリネーム（名前一括変更）
" - LspDocumentFormat              : ファイル全体の整形
" - LspCodeAction                  : Quick Fix（簡易修正案の適用）、import整理など
" - LspDocumentRangeFormat         : 選択範囲のみ整形
" - LspSignatureHelpi              : 関数呼び出し時のパラメータ/シグネチャ表示
" - LspHover                       : カーソル位置の詳細情報（型、ドキュメントなど）をポップアップで表示
" - LspDocumentDiagnostics         : 開いているファイルの診断結果一覧
" - LspNextError / LspPreviousError: 次/前のエラー・警告箇所にジャンプ
" - LspShowReferences              : エラーメッセージの詳細や参照リストのポップアップ表示
" - LspRestartServer               : LSPサーバの再起動
" - LspStopServer                  : LSPサーバの停止
""""""""""""""""""
nmap <silent> gd :LspDefinition<CR>
nmap <silent> gr :LspReferences<CR>
nmap <silent> <F2> :LspRename<CR>
nmap <silent> <Leader>q :LspCodeAction<CR>
nmap <silent> <Leader>f :LspDocumentFormat<CR>
nmap <silent> K :LspHover<CR>

""""""""""""""""""
" Grep
""""""""""""""""""
if executable('rg')
	" ripgrep を使用する設定
	set grepprg=rg\ --vimgrep\ --no-heading\ --line-number\ --color\ never
	set grepformat=%f:%l:%c:%m

	" 現在の単語でgrepを実行（バイナリファイル自動除外）
	nnoremap <Leader>rg :execute "grep! " . shellescape(expand("<cword>"))<CR>:copen<CR><CR>
endif

""""""""""""""""""
" 補完ウィンドウの設定
""""""""""""""""""
set completeopt=menuone,noinsert

" 補完ウィンドウ表示時にEnterで候補確定、ウィンドウ非表示時は改行
inoremap <expr><CR> pumvisible() ? "<C-y>" : "<CR>"

" 補完ウィンドウ表示時にCtrl-n/Ctrl-pで上下移動、それ以外は通常の動作
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocmd
" 
" 自動QuickFix
au QuickfixCmdPost make,grep,grepadd,vimgrep copen

