" backup
set directory=~/.vim/backup "swp
set backupdir=~/.vim/backup "~

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

" 強調表示
hi MatchParen ctermbg=1

" keymap
map t :tabnew<CR>
map tn :tabnext<CR>
map tp :tabprev<CR>
map tc :tabo<CR>
map t0 :tabfirst<CR>

" [unite]
" インサートモードで開く
let g:unite_enable_start_insert=1
" 大文字小文字区別なし
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" grep検索 ディレクトリ指定
nnoremap <silent> ,dg  :<C-u>Unite grep -buffer-name=search-buffer<CR>
" grep検索 カーソル位置の単語
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
" grep検索 結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
" grep検索 プロジェクト内
nnoremap <silent> ,e  :<C-u>Unite file_rec/async:!<CR>
" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
" 表示フォーマットなし、早くなる
let g:unite_source_file_mru_filename_format = ''
" ファイル履歴の数
let g:unite_source_file_mru_limit = 50
" (C-F):current directory files/(C-B):buffer/(C-H):history
noremap <C-U> :Unite -buffer-name=file file<CR>
"noremap <C-B> :Unite buffer<CR>
"noremap <C-H> :Unite file_mru<CR>
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

" [neosnippet]
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" [NeoBundle]
set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif



" [neocomplcache] 入力中に保管してくれるやつ
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()


" [NeoBundle]
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'sjl/badwolf'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'git://github.com/Shougo/vimproc'
" 初回のみコンパイルが必要
" cd ~/.vim/bundle/vimproc
" make
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

