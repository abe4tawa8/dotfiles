" Vim initializations (~/.vimrc)

" Vi互換を解除する
set nocompatible

" バックスペースキーの動作
" indent autoindent を超えてバックスペースを働かせる
" eol    改行を超えてバックスペースを働かせる (行を連結する)
" start  挿入区間の始めでバックスペースを働かせるが CTRL-W と CTRL-U は
"        挿入区間の始めでいったん止まる
set backspace=indent,eol,start

" 行番号を表示しない
set nonumber

" ビープ音の代わりにビジュアルベルを使う
set visualbell

" タブはスペースに展開する
set expandtab

" タブ幅を空白4つとする
set tabstop=4

" 自動インデントは空白4つとする
set shiftwidth=4

" テキスト幅で改行しない
set textwidth=0

" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

" 文字エンコーディング
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932

" 改行コード
set fileformat=unix
set fileformats=unix,dos,mac

" 改行文字やタブ文字を表示する
set list
set listchars=eol:¬,tab:▸\ ,trail:-

" 全角記号などの文字幅を2文字分とする
set ambiwidth=double

" ステータスライン
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" 常にステータスラインを表示する
set laststatus=2

" 複数のマッチがあるときは、全てのマッチを羅列し、共通する最長の文字列までを補完する
set wildmode=list:longest

" 自動的にファイルに保存する
set autowrite

" 日本語、英語の順にヘルプを探す
set helplang=ja,en

" ヘルプタグファイルを作成する
helptags $HOME/.vim/doc

" ファイル形式の検出を無効にする
filetype off

" NeoBundleを有効にする
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" 使用するプラグインを列記する
NeoBundle 'Shougo/vimproc'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'ujihisa/shadow.vim'
NeoBundle 'ngmy/vim-rubocop'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'rking/ag.vim'
NeoBundle 'szw/vim-tags'
NeoBundle 'editorconfig/editorconfig-vim'

call neobundle#end()

NeoBundleCheck

" ファイル形式の検出、プラグイン、インデントを有効にする
filetype plugin indent on

" ファイル形式別の設定
autocmd FileType ruby set tabstop=2 shiftwidth=2
autocmd FileType cucumber set tabstop=2 shiftwidth=2

" 構文強調を有効にする
syntax on

" 検索結果のハイライト
set hlsearch

nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>

nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

" 背景の色設定グループ
set background=dark

" カラースキーム
colorscheme solarized

" Solarized
let g:solarized_termcolors = 256
let g:solarized_termtrans = 1

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" unite.vim
" 入力モードで開始する
let g:unite_enable_start_insert = 0
" バッファ一覧
noremap <C-W><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-W><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使用したファイルの一覧
noremap <C-W><C-R> :Unite file_mru<CR>
" レジスタ一覧
noremap <C-W><C-Y> :Unite -buffer-name=register register<CR>

" vim-tags
" 使用する ctags コマンド
let g:vim_tags_ctags_binary = "/usr/local/bin/ctags"
" ctags コマンドを非同期で実行するか
let g:vim_tags_use_vim_dispatch = 1

" EOF
