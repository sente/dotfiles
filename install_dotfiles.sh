set -x
set -e

mkdir -p ${HOME}/logs
mkdir -p ${HOME}/logs/history
mkdir -p ${HOME}/logs/cmds

backupdir=dotfiles-$(date +%s)

mkdir ${HOME}/${backupdir}

set +e
cp -pvR ${HOME}/.bash/             ${HOME}/${backupdir}
cp -pvR ${HOME}/.bash_logout       ${HOME}/${backupdir}
cp -pvR ${HOME}/.bash_profile      ${HOME}/${backupdir}
cp -pvR ${HOME}/.bashrc            ${HOME}/${backupdir}
cp -pvR ${HOME}/.dir_colors        ${HOME}/${backupdir}
cp -pvR ${HOME}/.git-completion.sh ${HOME}/${backupdir}
cp -pvR ${HOME}/.gitconfig         ${HOME}/${backupdir}
cp -pvR ${HOME}/.inputrc           ${HOME}/${backupdir}
cp -pvR ${HOME}/.pythonrc          ${HOME}/${backupdir}
cp -pvR ${HOME}/.screenrc          ${HOME}/${backupdir}
#cp -pvR ${HOME}/.vim/              ${HOME}/${backupdir}
#cp -pvR ${HOME}/.vimrc             ${HOME}/${backupdir}
set -e


rm -rf ${HOME}/.bash
rm -rf ${HOME}/.bash_logout
rm -rf ${HOME}/.bash_profile
rm -rf ${HOME}/.bashrc
rm -rf ${HOME}/.dir_colors
rm -rf ${HOME}/.git-completion.sh
rm -rf ${HOME}/.gitconfig
rm -rf ${HOME}/.inputrc
rm -rf ${HOME}/.pythonrc
rm -rf ${HOME}/.screenrc
#rm -rf ${HOME}/.vim
#rm -rf ${HOME}/.vimrc


ln -s ${HOME}/dotfiles/.bash              ${HOME}/.bash
ln -s ${HOME}/dotfiles/.bash_logout       ${HOME}/.bash_logout
ln -s ${HOME}/dotfiles/.bash_profile      ${HOME}/.bash_profile
ln -s ${HOME}/dotfiles/.bashrc            ${HOME}/.bashrc
ln -s ${HOME}/dotfiles/.dir_colors        ${HOME}/.dir_colors
ln -s ${HOME}/dotfiles/.git-completion.sh ${HOME}/.git-completion.sh
ln -s ${HOME}/dotfiles/.gitconfig         ${HOME}/.gitconfig
ln -s ${HOME}/dotfiles/.inputrc           ${HOME}/.inputrc
ln -s ${HOME}/dotfiles/.pythonrc          ${HOME}/.pythonrc
ln -s ${HOME}/dotfiles/.screenrc          ${HOME}/.screenrc
#ln -s ${HOME}/dotfiles/.vim               ${HOME}/.vim
#ln -s ${HOME}/dotfiles/.vimrc             ${HOME}/.vimrc
