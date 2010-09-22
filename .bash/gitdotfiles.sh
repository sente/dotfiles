#!/bin/sh 

rm -rf .dotfiles.git 2>/dev/null
rm -rf  dotfiles.git 2>/dev/null 

git clone git@github.com:sente/dotfiles.git dotfiles.git || exit 1

mv dotfiles.git/.git .dotfiles.git || exit 1


(cd dotfiles.git && tar cf - . ; ) | tar df - | grep -v "Mod time differs"
(cd dotfiles.git && tar cf - . ; ) | tar xf - 


git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME ls-files | while read FILE; do

    if [  -f "$FILE" ];  then

        TTTT=$(git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME log --date=rfc "$FILE" | grep Date:  | head -n1 | sed 's/Date: *//')
        dd=$(date --date "$TTTT")
        touch -m -d "$dd" "$FILE"
    fi
done

rm -rf dotfiles.git
