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

colorscheme Tomorrow-Night

"フォント
set guifont=Ricty\ 12

"''インデント系
set expandtab "改宗しました
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

"保存関連のキーマップする
nmap z :w<CR>
nmap q :q<CR>
nmap QQ :q!<CR>

source ~/.config/nvim/plugins.vim
