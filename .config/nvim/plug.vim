if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'
Plug 'dracula/vim'  "evening theme

if has("nvim")
"nvim-lspconfig, is a collection of common configurations for language servers of each language
"but you need to set up the language servers for each language you use
Plug 'neovim/nvim-lspconfig'
"improve lsp GUI
Plug 'glepnir/lspsaga.nvim'

Plug 'preservim/nerdcommenter' "an easy way for commenting out lines
Plug 'scrooloose/nerdtree'   "file explorer for neovim(netrw comes as default for neovim)
Plug 'ryanoasis/vim-devicons' "devicon support for nerdtree
Plug 'andreshazard/vim-logreview'  "support for .log files
Plug 'mtdl9/vim-log-highlighting'

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
" C = Ctrl, A = Alt
" new hot key "Alt + 1"
nnoremap <silent> <A-1> :NERDTreeToggle<CR>

nnoremap <C-W> [{V%
xnoremap <C-W> "_y[{V%

" t hot-key to open file exploret hot-key to open file explorer start NERDTree automaticly and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p
"-----------------------------------------------------------------------

" The function will get the height of the current window, and accordingly to its parameter will scroll the screen up or down of a quarter of the height.
" The mappings will call the function, if press alt+Up or alt+Down

function! ScrollQuarter(move)
    let height=winheight(0)

    if a:move == 'up'
        let key="\<C-Y>"
    else
        let key="\<C-E>"
    endif

    execute 'normal! ' . height/4 . key
endfunction

nnoremap <silent> <A-up> :call ScrollQuarter('up')<CR>
nnoremap <silent> <A-down> :call ScrollQuarter('down')<CR>

"config for nerdcommenter

" default for toggle uncomment "\+c+space"
" new hot key: ",cc"
map ,cc <plug>NERDCommenterToggle
