set runtimepath+=~/.config/nvim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.config/nvim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  " Color theme
  NeoBundle 'chriskempson/vim-tomorrow-theme'
  " Suggestion
  NeoBundle 'Shougo/deoplete.nvim'
  " Binary
  NeoBundle 'Shougo/vinarise'
  " Indent guide
  NeoBundle 'nathanaelkane/vim-indent-guides'
  " Support Dockerfile
  NeoBundle 'ekalinin/Dockerfile.vim'
  " Support Go-lang
  NeoBundle 'fatih/vim-go'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

let g:deoplete#enable_at_startup = 1

" auto run Vinarise if use -b option
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | Vinarise
  autocmd BufWritePre * if &binary | Vinarise | endif
  autocmd BufWritePost * if &binary | Vinarise 
augroup END

" guide to indent
" auto startup
let g:indent_guides_enable_on_vim_startup=1

let g:indent_guides_color_change_percent = 30
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
