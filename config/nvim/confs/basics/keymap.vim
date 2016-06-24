"保存関連のキーマップする
nmap z :w<CR>
nmap q :q<CR>
nmap QQ :q!<CR>

" tab settings
nmap ut :Unite tab<CR>
nmap tn :tabnew<CR>
nmap tt gt<CR>
nmap tb gT<CR>

"検索関連
noremap <ESC><ESC> :noh<CR>

" setting brankets
inoremap <C-s> <ESC>/<C-u>\v\)\|\}\|\]\|"\|'\|\><CR>:noh<CR>a

" Open vimfiler
noremap <C-X><C-X> :VimFilerExplorer -simple -winwidth=45 -no-quit <CR>
