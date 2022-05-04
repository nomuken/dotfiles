if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=/Users/nomuken/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/nomuken/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('/Users/nomuken/.cache/dein/repos/github.com/Shougo/dein.vim')

let s:dein_cache = expand("~/.cache/nvim/dein/cache")
let s:package_list = expand("~/.config/nvim/packages/plugins.toml")
let s:package_list_lazy = expand("~/.config/nvim/packages/plugins.lazy.toml")

if dein#load_state(s:dein_cache)
  call dein#begin(s:dein_cache)
    
  call dein#load_toml(s:package_list, {'lazy': 0})
  call dein#load_toml(s:package_list_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
