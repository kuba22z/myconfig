if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'
Plug 'dracula/vim'  "evening theme
Plug 'mtdl9/vim-log-highlighting' "support for .log files, syntax highlighting

if has("nvim")
"nvim-lspconfig, is a collection of common configurations for language servers of each language
"but you need to set up the language servers for each language you use
Plug 'neovim/nvim-lspconfig'
"improve lsp GUI
Plug 'glepnir/lspsaga.nvim'

Plug 'preservim/nerdcommenter' "an easy way for commenting out lines
Plug 'scrooloose/nerdtree'   "file explorer for neovim(netrw comes as default for neovim)
Plug 'ryanoasis/vim-devicons' "devicon support for nerdtree

endif


call plug#end()
"-----------------------------------------------------------------------

" config for nerdtree

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" default for open file explorer: "Ctrl + t"
" new hot key "Ctrl + s"
nnoremap <silent> <C-s> :NERDTreeToggle<CR>

" t hot-key to open file exploret hot-key to open file explorer start NERDTree automaticly and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p
"-----------------------------------------------------------------------

"config for nerdcommenter

" default for toggle uncomment "\+c+space"
" new hot key: ",cc"
map ,cc <plug>NERDCommenterToggle
