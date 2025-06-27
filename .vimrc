set nocompatible
filetype plugin indent on
syntax on
runtime macros/matchit.vim

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

" Grep
"
" rg があれば使う
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat=%f:%l:%c:%m
endif
 
 " 自動QuickFix
 au QuickfixCmdPost make,grep,grepadd,vimgrep copen

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
Plug 'previm/previm'
Plug 'tyru/open-browser.vim'
Plug 'mattn/vim-maketable'
Plug 'terryma/vim-expand-region'
Plug 'unblevable/quick-scope'
Plug 'preservim/nerdcommenter'
Plug 'fidian/hexmode'
Plug 'mattn/vim-maketable'
Plug 'editorconfig/editorconfig-vim'
Plug 'kshenoy/vim-signature'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
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

" マッピング
" 
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

" ripgrep を使用する設定
set grepprg=rg\ --vimgrep\ --no-heading\ --line-number\ --color\ never
set grepformat=%f:%l:%c:%m

" 現在の単語でgrepを実行（バイナリファイル自動除外）
nnoremap <Leader>rg :execute "grep! " . shellescape(expand("<cword>"))<CR>:copen<CR>

" fzf
"
nnoremap <C-p> :Files<CR>
nnoremap <C-c> :Rg<Space>
