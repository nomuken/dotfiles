" dark power suggestion
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

" deoplete settings
inoremap <expr><tab> pumvisible() ? "\<down>" : "\<tab>"

" setting brankets
inoremap <C-s> <ESC>/<C-u>\v\)\|\}\|\]\|"\|'\|\><CR>:noh<CR>a

" Unite Configs...
noremap mru :Unite file_mru<CR>
noremap file :Unite file<CR>
noremap yank :Unite history/yank<CR>
noremap <C-g>l :Unite giti/log<CR>
noremap <C-g>b :Unite giti/branch<CR>
noremap <C-g>s :Unite giti/status<CR>

" commentout
nmap cc <Plug>(caw:I:toggle)
vmap cc <Plug>(caw:I:toggle)
