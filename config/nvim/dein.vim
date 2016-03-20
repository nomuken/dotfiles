" set dein values
"" plugins path
let s:dein_dir = expand('~/.config/nvim/dein/packages')

"" dein's dir
let s:dein_repo_dir = '~/.config/nvim/dein/packages/dein.vim'

"" dein's cache
let s:dein_cache_dir = expand('~/.cache/nvim/dein')

"" package lists
let s:toml = '~/.config/nvim/dein/plugins.toml'
let s:lazy_toml = '~/.config/nvim/dein/plugins_lazy.toml'

" set runtimepath(use dein)
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy' : 1})
endif

call dein#end()
call dein#save_state()

" install 
if dein#check_install()
  call dein#install()
endif

syntax on