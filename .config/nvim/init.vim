"config Section
set number
set encoding=UTF-8
 

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
endif


" Syntax theme "{{{
" ---------------------------------------------------------------------
"
" 
" theme by https://github.com/craftzdog/dotfiles-public/blob/master/.config/nvim/init.vim
"if exists("&termguicolors") && exists("&winblend")
"  syntax enable
"  set termguicolors
"  set winblend=0
"  set wildoptions=pum
"  set pumblend=5
"  set background=dark
" Use NeoSolarized
"  let g:neosolarized_termtrans=1
"  runtime ./colors/NeoSolarized.vim
"  colorscheme NeoSolarized
"endif


if (has("termguicolors"))
 	set termguicolors
endif
syntax enable
colorscheme dracula

"}}}

