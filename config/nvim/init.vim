" 慣習
filetype off
filetype plugin indent off

"ﾌﾟﾗｷﾞﾝをロードする
runtime! confs/basics/*.vim
runtime! confs/always_plugins/*.vim

" python runtimes
let g:python3_host_prog = '/usr/bin/python'

"俺はアンドゥし続けたい
set undofile
"作るのはいいんだけど，gitとの兼ね合いで邪魔になることが多いので.vim/undoフォルダに保存してくれ
set undodir=~/.cache/nvim/undo/

"移動しちゃうぞい
cd %:h

"'''''''''''''''システム系'''''''''''''''''''
"俺はシステムとクリップボードと共有したいぞ
set clipboard+=unnamed
"バックアップは本体を保存したら消去  
set nowritebackup
"行番号
set number

set background=dark
colorscheme hybrid

"''インデント系
set expandtab "改宗しました
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"タイトル
set title

"時間でカッコ消えて欲しい．すごく．
set showmatch matchtime=1

" start some detect
filetype plugin indent on
