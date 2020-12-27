if &compatible
  set nocompatible
endif

let s:dein_path = expand("~/.cache/nvim/dein/repos/github.com/Shougo/dein.vim")
let s:dein_cache = expand("~/.cache/nvim/dein/cache")
let s:package_list = expand("~/.config/nvim/packages/plugins.toml")
let s:package_list_lazy = expand("~/.config/nvim/packages/plugins.lazy.toml")

execute "set runtimepath+=".s:dein_path

if dein#load_state(s:dein_cache)
  call dein#begin(s:dein_cache)
    
  call dein#load_toml(s:package_list, {'lazy': 0})
  call dein#load_toml(s:package_list_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
