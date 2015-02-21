" 表示
set number " 行番号

" clipboard
set clipboard=unnamed " clipboardを使用する

" 保存
set hidden " 終了前に保存確認

" 検索
set hlsearch " ハイライト
set smartcase " 大文字小文字を無視して検索

" タブ
set tabstop=2 " 画面上タブを何文字の幅で表示するか
set shiftwidth=2 " 自動挿入インデントや< >で挿入/削除するインデントの幅
set expandtab " タブをスペースに展開
set autoindent

" 色
syntax enable " 構文に色を付ける
set background=dark
colorscheme industry

" NeoBundle
set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'sjl/badwolf'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

