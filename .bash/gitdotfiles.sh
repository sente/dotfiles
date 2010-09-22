#!/bin/sh 

if [[ "$1" != "run" ]]; then
    echo "usage: \"$0 run\""
    exit 1
fi

git clone git@github.com:sente/dotfiles.git dotfiles.git
mv dotfiles.git/.git .dotfiles.git
shopt -s dotglob

rm -rf dotfiles.git

(cd dotfiles.git && tar cf - . ; ) | tar xvf - 

git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME ls-files | while read FILE; do

    if [  -f "$FILE" ];  then

        TTTT=$(git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME log --date=rfc "$FILE" | grep Date:  | head -n1 | sed 's/Date: *//')
        dd=$(date --date "$TTTT")
        touch -m -d "$dd" "$FILE"
    fi
done
