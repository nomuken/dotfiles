" gocode informations
let g:deoplete#sources#go = 'vim-go'
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/1.6.2/linux_amd64'
let g:deoplete#sources#go#use_cache = 1
