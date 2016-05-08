" dark power suggestion
let g:deoplete#enable_at_startup = 1
call remote#host#RegisterPlugin('python3', '/home/nomuken/.cache/nvim/dein/.dein/rplugin/python3/deoplete', [
      \ {'sync': v:true, 'name': '_deoplete', 'type': 'function', 'opts': {}},
     \ ])

" deoplete settings
inoremap <expr><tab> pumvisible() ? "\<down>" : "\<tab>"

