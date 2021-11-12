



filetype plugin indent on  "???
syntax enable
set mouse=a

"reset augroup
augroup MyAutoCmd
	autocmd!
augroup END

set number
set termguicolors
set ignorecase smartcase
set clipboard+=unnamedplus "I DON'T fully understand it yet.
set scrolloff=5 "数行余裕がある内にスクロール

" ----- dein {{{
" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
"if dein#load_state($HOME . '/.cache/dein')

  " XDG base direcory compartible
  let g:dein#cache_directory = $HOME . '/.cache/dein'

  " dein begin
  call dein#begin($HOME . '/.cache/dein')

 " プラグインリストを収めた TOML ファイル
 " 予め TOML ファイル（後述）を用意しておく
 let s:toml_dir  = $HOME . '/.config/nvim' 
 let s:toml      = s:toml_dir . '/dein.toml'
 let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

 " TOML を読み込み、キャッシュしておく
 call dein#load_toml(s:toml,      {'lazy': 0})
 call dein#load_toml(s:lazy_toml, {'lazy': 1})


  " Required:
  call dein#end()
  call dein#save_state()
"endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"}}}---------


"----- keybind ---{{{
inoremap <c-c> <esc>
"}}}-----------


" Vimscript file settings------------------{{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}


