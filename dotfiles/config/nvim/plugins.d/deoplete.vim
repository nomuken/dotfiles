let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 3
call deoplete#custom#source('dictionary', 'min_pattern_length', 4)
set completeopt+=noinsert

"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ deoplete#manual_complete()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><C-e> deoplete#cancel_popup()
