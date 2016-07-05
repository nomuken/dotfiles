set completeopt-=preview
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
let g:deoplete#omni#input_patterns.cs = '\s+\w+[^=\);]'
let g:OmniSharp_selector_ui = 'unite'

augroup omnisharp_commands
  autocmd!

  noremap! <C-l> <ESC>:OmniSharpGetCodeActions<CR>
augroup END
