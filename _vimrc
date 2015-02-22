" backup
set directory=~/.vim/backup

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

" keymap
map t :tabnew<CR>
map tn :tabnext<CR>
map tp :tabprev<CR>
map tc :tabo<CR>
map t0 :tabfirst<CR>

" [unite]
" インサートモードで開く
let g:unite_enable_start_insert=1
" 表示フォーマットなし、早くなる
let g:unite_source_file_mru_filename_format = ''
" ファイル履歴の数
let g:unite_source_file_mru_limit = 50
" (C-F):current directory files/(C-B):buffer/(C-H):history
noremap <C-F> :Unite -buffer-name=file file<CR>
noremap <C-B> :Unite buffer<CR>
noremap <C-H> :Unite file_mru<CR>
" set to sources the current directory
noremap :utf :<C-u>UniteWithBufferDir file -buffer-name-file<CR>
" (ESC-ESC):quit
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" initial functionn
au FileType unite call s:unite_my_settings()
  function! s:unite_my_settings()
  endfunction


" [nerdtree]
" ファイル指定なしでvimを起動した時に表示
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" ファイル指定ありでvimを起動した時に表示
"autocmd vimenter * NERDTree
" 左側にnerdtreeeだけ残ったら自動で閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" key mapping(open/close)
map <C-n> :NERDTreeToggle<CR>


" [NeoBundle]
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
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Lokaltog/vim-powerline'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

