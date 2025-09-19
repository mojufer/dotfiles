runtime! archlinux.vim


set nu
" Colors
syntax on
" set cursorline " underline current line
" colorscheme COLOR_SCHEME_NAME
" Possible COLOR_SCHEME_NAME : default, blue, darkblue, delek, desert, elford, evening, industry, koehler, morning, murphy, pablo, peachpuff, ron, shine, slate, torte, zellner


" Indentation
set tabstop=2
set shiftwidth=2
set autoindent
" set expendtab " replace tabs with spaces


" Clipboard integration
set clipboard=unnamedplus


" Plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim' , {'branch': 'release'}
" Plug 'christoomey/vim-system-copy'

call plug#end()


" Colors
colorscheme gruvbox
set background=dark


" Colors

" enable true color support
if (has("termguicolors"))
		set termguicolors
endif

colorscheme gruvbox

" make the background transparent
highlight Normal ctermbg=NONE guibg=NONE
highlight NormalNC ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight VertSplit ctermbg=NONE guibg=NONE
highlight StatusLine ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight Pmenu ctermbg=NONE guibg=NONE


" LaTeX with vimtex plugin
let g:vimtex_compiler_method = 'latexmk'  " use latexmk for compilation (recommended)
let g:vimtex_view_method = 'zathura'      " set your PDF viewer here
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options = '--synctex-forward @line:@col:@tex @pdf'

augroup vimtex_auto_compile
  autocmd!
  autocmd BufReadPost *.tex VimtexCompile
augroup END





" Autocompletion
" Use <Tab> and <S-Tab> to navigate popup menu
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <CR> to confirm completion if popup menu is visible
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
inoremap <silent><expr> <C-Space> coc#refresh()


" Clipboard
" Automatically copy to system clipboard on all yanks
" augroup YankToClipboard
  " autocmd!
  " autocmd TextYankPost * call system('wl-copy', getreg('"'))
" augroup END

" Paste from system clipboard with wl-paste (p in normal mode)
" nnoremap p :call append(line('.'), split(system('wl-paste'), "\n"))<CR>
" vnoremap p "_dP
