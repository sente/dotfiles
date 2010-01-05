#!/bin/sh

git-ls-files | while read file; do
   if [ ! -f $HOME/$file ]; then
      echo "$HOME/$file -- does not exist"
   else
      cmp $HOME/$file $file
   fi
done



#SAFE=~/.dotfile.`date +%F` 
#
#mkdir $SAFE || exit 1
#
#cp -a ~/.vim ~/.bash ~/.vimrc ~/.bashrc $SAFE
#
#mv ~/.vim $SAFE
#mv ~/.bash $SAFE
#mv ~/.vimrc $SAFE
#mv ~/.bashrc $SAFE
#
#HOME=~
#echo $HOME
#
#
#find ./ -mindepth 1 -type d -not -path "*.git*" > dirs.txt
#find ./ -mindepth 1 -type f -not -path "*.git*" > files.txt
#
#
#cat dirs.txt | while read line; do
#   mkdir "$DEST/$line"
#done
#
#cat files.txt | while read line; do
#   cp -a "$line" "$DEST/$line"
#done
