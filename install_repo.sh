mkdir SAFE || return 1

test -f .ackrc && mv .ackrc SAFE
test -f .vimrc && mv .vimrc SAFE
test -f .bashrc && mv .bashrc SAFE

test -d .vim  && mv .vim SAFE
test -d .bash && mv .bash SAFE




test -f .ackrc  && { echo ".ackrc not moved";  return 1; }
test -f .bashrc && { echo ".bashrc not moved"; return 1; }
test -f .vimrc  && { echo ".vimrc not moved";  return 1; }

test -d .vim   && { echo ".vim not moved";  return 1; }
test -d .bash  && { echo ".bash not moved";  return 1; }

cp -a DOTFILES/.ackrc  .
cp -a DOTFILES/.bashrc .
cp -a DOTFILES/.vimrc  .
cp -a DOTFILES/.vim    .
cp -a DOTFILES/.bash   .

