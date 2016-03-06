let s:dein_dir = expand('~/.config/nvim/dein/packages')
set runtimepath+=~/.config/nvim/dein/packages/dein.vim

call dein#begin(s:dein_dir)

let s:toml      = '~/.config/nvim/dein/plugins.toml'
let s:lazy_toml      = '~/.config/nvim/dein/plugins_lazy.toml'

if dein#load_cache([expand('<sfile>'), s:toml, s:lazy_toml])
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#save_cache()
endif

call dein#end()

if dein#check_install()
  call dein#install()
endif

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

" neocomplete settings
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
