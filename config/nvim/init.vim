runtime! dein.vim

set undofile
set undodir=~/.cache/nvim/undo/

set clipboard+=unnamedplus
set nowritebackup
set number

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

set showmatch
set matchtime=1

set cursorline
set cursorcolumn
hi CursorLineNr term=bold   cterm=NONE ctermfg=228 ctermbg=NONE

nmap z :w<CR>
nmap q :q<CR>
nmap QQ :q!<CR>

nmap tn :tabnew<CR>
nmap tt gt<CR>
nmap tb gT<CR>

noremap <ESC><ESC> :noh<CR>

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif
