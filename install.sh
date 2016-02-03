#! /bin/zsh

usage() {
  echo "Usage: \e[1m${1} -t <type> <options>\e[0m"
  echo
  echo "\e[1mType:\e[0m"
  echo "\tserver\t\tMake server environment"
  echo "\tdesktop\t\tMake desktop environment"
  echo
  echo "\e[1mOptions:\e[0m"
  echo "\t-i\t\tUse interactive mode"
}

alert() {
  echo -e "\e[41m[!]\e[49m\e[38;5;9m ${1}\e[39m"
}

notice() {
  echo -e "\e[48;5;17m[*]\e[49m\e[38;5;75m ${1}\e[39m"
}

_task() {
  ans="y"
  if test $# -gt 2 -a $3 -eq 1;then
    echo "\e[0mＲｅａｄｙ？"
    echo "[y] or [Other]"
    echo -n "\e[1m>"
    read  ans
    echo  -n "\e[0m"
  fi
  if test "${ans}" = "y";then
    notice "Exec \"${2}\"."
    echo
    eval $2
    echo
  fi
}

install() {
  echo "\e[97;48;5;106m>>>>>>>>>>>>>>>>>>>>>> Install \e[4m\e[1m${1}\e[0m\e[97;48;5;106m. <<<<<<<<<<<<<<<<<<<<<<\e[0m"
  _task $1 $2 $INTERA
}

setup () {
  echo "\e[97;42m>>>>>>>>>>>>>>>>>>>>>> ${1} <<<<<<<<<<<<<<<<<<<<<<\e[0m"
  _task $1 $2 $INTERA
}

DIR=`pwd`
TARGET=""
INTERA=0

while getopts ":t:i" opts
do
  case ${opts} in 
    t)
      case $OPTARG in
        server)
          notice "OK, deploying server environment..."
          ;;
        desktop)
          notice "OK, deploying desktop environment..."
          ;;
        *)
          alert "Oops, unknown environment \e[4m\e[1m${OPTARG}\e[21m\e[24m, exit..."
          usage $0
          exit 1
          ;;
      esac
      TARGET=${OPTARG}
      ;;
    i)
      notice "OK, use interactive mode"
      INTERA=1
      ;;
    :|\?)
      alert "Oops, unknown opts \"${OPTARG}\", exit..."
      usage $0
      exit 1
      ;;
  esac
done

if test "${TARGET}" = "" ;then
  alert "Oops, undifined target, exit..."
  usage $0
  exit 1
fi

#install "miku" "echo MikuMiku"
#setup "echo miku" "echo MikuMiku"
#exit 1

general_task() {
  setup "Make .config dir" "mkdir -p ~/.config"
  install "NeoBundle" "git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim"
  install "My vimrc" "ln -s ${DIR}/vimrc ~/.vimrc"
  install "my tmux.conf" "ln -s `pwd`/tmux.conf ~/.tmux.conf"
  install "Prezto" "git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto"
  install "zsh highliting" "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zprezto/zsh-syntax-highlighting"
}

desktop_task() {
  setup "Make xmonad dir" "mkdir ~/.xmonad"
  install "My Xmodmap" "ln -s ${DIR}/Xmodmap ~/.Xmodmap"
  install "My nvim confs" "ln -s ${DIR}/config/nvim ~/.config/"
  install "My xmonad.hs" "ln -s `pwd`/xmonad.hs ~/.xmonad/xmonad.hs"
  install "My xmobarrc" "ln -s `pwd`/xmobarrc.hs ~/.xmobarrc"
  install "My qtile confs" "ln -s ${DIR}/config/qtile ~/.config/"
  install "My termite confs" "ln -s ${DIR}/config/termite ~/.config/"
  install "My latexmkrc" "ln -s $DIR/latexmkrc ~/.latexmkrc"
  install "My ssh key from github" "curl http://sandbox.spica.bz/sh/installSshKey.sh | bash -"
  install "pyenv" "git clone https://github.com/yyuu/pyenv.git ~/.pyenv"
  install "virtualenv" "git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv"
}

server_task() {
  alert "Server's task isn't implementation."
}

_setup_prezto() {
  setopt EXTENDED_GLOB

  rm -rf ~/.zsh*

  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

  echo "source $PWD/zshrc" >> ~/.zshrc
}

general_task
notice "Finished general_task"

case ${TARGET} in 
  desktop)
    desktop_task
    notice "Finished desktop_task"
    ;;
  server)
    server_task
    notice "Finished server_task"
    ;;
esac

notice "All done."
