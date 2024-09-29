set nocompatible

const s:dpp_base = '~/.cache/nvim/dpp_base'

const s:dpp_src = '~/.cache/nvim/dpp.vim'
const s:denops_src = '~/.cache/nvim/vim-denops.vim'

const s:dpp_config = '~/.config/nvim/dpp/index.ts'

const s:ext_installer = '~/.cache/nvim/dpp-ext-installer'
const s:ext_git = '~/.cache/nvim/dpp-protocol-git'
const s:ext_lazy = '~/.cache/nvim/dpp-ext-lazy'
const s:ext_toml = '~/.cache/nvim/dpp-ext-toml'

execute 'set runtimepath^=' .. s:dpp_src

if s:dpp_base->dpp#min#load_state()
  execute 'set runtimepath^=' .. s:denops_src
  execute 'set runtimepath^=' .. s:ext_installer
  execute 'set runtimepath^=' .. s:ext_git
  execute 'set runtimepath^=' .. s:ext_lazy
  execute 'set runtimepath^=' .. s:ext_toml

  autocmd User DenopsReady
  \ : echohl WarningMsg
  \ | echomsg 'dpp load_state() is failed'
  \ | echohl NONE
  \ | call dpp#make_state(s:dpp_base, s:dpp_config)
endif
