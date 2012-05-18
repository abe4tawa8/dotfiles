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

" タブはスペースに展開する
set expandtab

" タブ幅を空白4つとする
set tabstop=4

" 自動インデントは空白4つとする
set shiftwidth=4

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

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" ファイル形式の検出、プラグイン、インデントを有効にする
filetype plugin indent on

" ファイル形式別の設定
autocmd FileType ruby set tabstop=2 shiftwidth=2
autocmd FileType cucumber set tabstop=2 shiftwidth=2

" 構文強調を有効にする
syntax on

" カラースキーム
colorscheme murphy

" EOF