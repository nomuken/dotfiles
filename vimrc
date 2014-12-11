"俺はアンドゥし続けたい
set undofile
"作るのはいいんだけど，gitとの兼ね合いで邪魔になることが多いので.vim/undoフォルダに保存してくれ
set undodir=~/.vim/undo/

"移動しちゃうぞい
cd %:h

"'''''''''''''''システム系'''''''''''''''''''
"俺はシステムとクリップボードと共有したいぞ
set clipboard+=unnamed
"バックアップは本体を保存したら消去  
set nowritebackup
"行番号
set number

"''インデント系
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"''シンタックス系
syntax on

"タイトル
set title

"時間でカッコ消えて欲しい．すごく．
set showmatch matchtime=1

"カラーテーマを決めよう
colorscheme Tomorrow-Night

"保存関連のキーマップする
nmap z :w<CR>
nmap q :q<CR>
nmap QQ :q!<CR>

"''''''''''''突然のNeoBundleの設定'''''''''''

set nocompatible							 " Be iMproved

filetype off

if has('vim_starting')
		set runtimepath+=~/.vim/bundle/neobundle.vim/
		endif

		call neobundle#begin(expand('~/.vim/bundle/'))
		NeoBundleFetch 'Shougo/neobundle.vim'
		call neobundle#end()
		
		" Let NeoBundle manage NeoBundle
		NeoBundleFetch 'Shougo/neobundle.vim'

		" Recommended to install
		NeoBundle 'Shougo/vimproc', {
					\ 'build' : {
					\			'windows' : 'make -f make_mingw32.mak',
					\			'cygwin' : 'make -f make_cygwin.mak',
					\			'mac' : 'make -f make_mac.mak',
					\			'unix' : 'make -f make_unix.mak',
					\		 },
					\ }

		" My Bundles here:
		"
		" Original repos on github
		NeoBundle 'Shougo/vimshell'
		NeoBundle 'terryma/vim-multiple-cursors.git'
		NeoBundle 'tpope/vim-surround'
		NeoBundle 'scrooloose/syntastic'
		NeoBundle 'scrooloose/nerdtree'
		NeoBundle 'Shougo/neomru.vim'
		NeoBundle 'MetalPhaeton/easybracket-vim'
		NeoBundle 'w0ng/vim-hybrid'
		NeoBundle 'chriskempson/vim-tomorrow-theme'
		NeoBundle 'vim-ruby/vim-ruby'
		"NeoBundle 'mattn/multi-vim'
		filetype plugin indent on			" Required!
	
		"haml syntax
		NeoBundle 'tpope/vim-haml'
		
		"slim syntax
		NeoBundle "slim-template/vim-slim"
		filetype plugin indent on
		" Enable slim syntax highlight
		autocmd FileType slim setlocal foldmethod=indent
		autocmd BufNewFile,BufRead *.slim set filetype=slim
	
		"Writting for haskell
		NeoBundle 'dag/vim2hs'
		NeoBundle 'ujihisa/neco-ghc'
		NeoBundle 'eagletmt/ghcmod-vim'
		NeoBundle 'thinca/vim-quickrun'
		NeoBundle 'kana/vim-filetype-haskell'
"''''''''''''''''''TeX Setup''''''''''''''''''''''
let g:quickrun_config = {}
" let g:quickrun_config['tex'] = {
" \				'command': 'latexmk',
" \				'exec': ['%c %s', 'xdg-open %s:r.pdf']
" \}
let g:quickrun_config['tex'] = {
						\		'command' : 'latexmk',
						\		'outputter' : 'error',
						\		'outputter/error/error' : 'quickfix',
						\		'cmdopt': '-pdfdvi',
						\		'exec': ['%c %o %s','xdg-open %s:r.pdf']
						\ }

"'''''''''''''''''''Haskell Setup''''''''''''''''''
"型推論関連
"のパスを通す
let $PATH = $PATH . ':' . expand('~/.cabal/bin')
"マッピング
nmap	<C-T>	:GhcModType<CR>
nmap	<S-T>	:GhcModTypeClear<CR>
nmap	run	:QuickRun<CR>

"'''''''''''''''''''Ruby関連''''''''''''''''''''''''
"

"''''''''''''''''Indent guide'''''''''''''''''''''''
"Indentで線を引こうぜ
NeoBundle 'nathanaelkane/vim-indent-guides'

"vimが立ち上がったら，このプラグインを起動するべき
let g:indent_guides_enable_on_vim_startup=1

"ハイライト色結構変化してくれ
let g:indent_guides_color_change_percent = 30
"インデントの可視化を1番目から
let g:indent_guides_start_level = 1
"幅は1で頼む
let g:indent_guides_guide_size = 1
" 自動カラー無効
let g:indent_guides_auto_colors=0
" 奇数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
" 偶数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray


"'''''''''''''''''''nerdtree関連''''''''''''''''''''
"NERDTREEをなにも開くものがなければ利用する
"autocmd vimenter * if !argc() | NERDTree | endif

"全部のバッファを閉じたら消す
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"<C-D>でどこでもONとOFFできるんだよ！
nmap <silent> <C-D>			 :NERDTreeToggle<CR>
vmap <silent> <C-D> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-D>			 :NERDTreeToggle<CR>
imap <silent> <C-D> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-D> <C-u>:NERDTreeToggle<CR>

"'''''''''''''''Unite関連'''''''''''''''''
"unite導入
NeoBundle 'Shougo/unite.vim'
"キーボードショートカットの設定
"（<C-M>はCtrl+Mという意味）

"buffer一覧
noremap <C-U><C-P> :Unite buffer<CR>
"ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" " ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
"ESCを2回で終了
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"''''''''''コメントアウトしたい''''''''''''
NeoBundle 'tyru/caw.vim'
nmap <C-c> <Plug>(caw:I:toggle)
vmap <C-c> <Plug>(caw:I:toggle)


"''''''''''''neocomplcache関連'''''''''''''
"neocomplcacheのインストール
NeoBundle 'Shougo/neocomplcache'
" いっくよー☆
let g:neocomplcache_enable_at_startup = 1
" 大文字が入力されるまで大文字小文字の区別をなくす
let g:neocomplcache_enable_smart_case = 1
" 大文字を区切りとして補完を探す
let g:neocomplcache_enable_camel_case_completion = 1
" キャッシュする最小文字数です
let g:neocomplcache_min_syntax_length = 3
" ロックするよ
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" 辞書ファイル
let g:neocomplcache_dictionary_filetype_lists = {
		\ 'default' : ''
		\ }

"" キーマップ
"前回の補完をキャンセルするんだよ！
inoremap <expr><C-g>		 neocomplcache#undo_completion()
"共通する部分を保管するよ！
inoremap <expr><C-l>		 neocomplcache#complete_common_string()
"<C-H>と<BS>で候補表示を消去
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"<C-E>で現在の候補をキャンセルする
inoremap <expr><C-e> neocomplcache#cancel_popup()
"<C-Y>で現在の候補を確定する
inoremap <expr><C-y> neocomplcache#close_popup()




"''''''''''''''''''neosnippet関連''''''''''''''''''''
"Neosnippetを導入
NeoBundle 'Shougo/neosnippet'
""キーバインドを変更する
"tabで下を見て，Shift+tabで上に戻る
inoremap <expr><S-TAB>	pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"入力文字候補をSnippetでCtrl+Kで展開するデース
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

"snippetを増やすドン
NeoBundle 'honza/vim-snippets'
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets,~/.vim/snippet'

"''''''''''''vimのマルチカーソル強化''''''''''''''''"
"デフォを使用
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<F6>'

"''''''''''''vim-over'''''''''''''''''
NeoBundle 'osyo-manga/vim-over'


"'''''''''''''''vimshell関連'''''''''''''''''''''''''
"vimshellを導入
NeoBundle 'Shougo/vimshell'
"キーバインド設定するよ
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vp :VimShellPop %:p:h<CR>

"'''''''''''''''''''''後始末''''''''''''''''''''''''
NeoBundleCheck
