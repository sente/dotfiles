#!/bin/sh
# vim: set ft=sh et sw=4 sts=4 ts=4:

if [ ! -d ${HOME}/logs/cmds/ ] ; then
   exit 0
fi



function add-wrapper()
{

CMD=$1

foo=$(cat - <<"EOF"

function $CMD() {
    echo -e  "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/$CMD.log 2>/dev/null
    command $CMD "$@"
}
export -f $CMD
EOF

)

echo "$foo" | sed s/\$CMD/$CMD/g >> ${HOME}/.bash/wrappers.sh;

}





#there has got to be a better way...

function xargs() {
    echo -e "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/xargs.log 2>/dev/null
    command xargs "$@"
}
function bash() {
    echo -e "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/bash.log 2>/dev/null
    command bash "$@"
}
function awk() {
    echo -e "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/awk.log 2>/dev/null
    command awk "$@"
}
function python() {
    echo -e "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/python.log 2>/dev/null
    command python "$@"
}
function vim() {
    echo -e "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/vim.log 2>/dev/null
    command vim "$@"
}
function curl() {
    echo -e "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/curl.log 2>/dev/null
    command curl "$@"
}
function tar() {
    echo -e "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/tar.log 2>/dev/null
    command tar "$@"
}
function find() {
    echo -e "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/find.log 2>/dev/null
    command find "$@"
}
function ssh() {
    echo -e "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/ssh.log 2>/dev/null
    command ssh "$@"
}
function wget() {
    echo -e "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/wget.log 2>/dev/null
    command wget "$@"
}
function rsync() {
    echo -e "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/rsync.log 2>/dev/null
    command rsync "$@"
}
function ls() {
    echo -e "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/ls.log 2>/dev/null
    command ls "$@"
}
function mkdir() {
    echo -e "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/mkdir.log 2>/dev/null
    command mkdir "$@"
}
function cd() {
    echo -e "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/cd.log 2>/dev/null
    command cd "$@"
}
function grep() {
    echo -e "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/grep.log 2>/dev/null
    command grep "$@"
}
function ipython() {
    echo -e "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/ipython.log 2>/dev/null
    command ipython "$@"
}
function git() {
    echo -e  "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/git.log 2>/dev/null
    command git "$@"
}
function ssh() {
    echo -e  "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/ssh.log 2>/dev/null
    command ssh "$@"
}

export -f awk
export -f python
export -f vim
export -f curl
export -f tar
export -f find
export -f ssh
export -f wget
export -f rsync
export -f ls
export -f mkdir
export -f cd
export -f grep
export -f ipython
export -f git
export -f ssh


#        echo -e  "$(date +%s)\t$PWD\t$(history 1)" >> ${HOME}/logs/cmds/awk.log 2>/dev/null
#        command awk "$@"
#        echo $PPID >> ${HOME}/logs/cmds/awk.log
#        echo $LINENO >> ${HOME}/logs/cmds/awk.log
#        inspect LINENO
#        inspect PPID
#        echo "\$0=$0"


function md5sum() {
    echo -e  "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/md5sum.log 2>/dev/null
    command md5sum "$@"
}

export -f md5sum

function runremote() {
    echo -e  "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/runremote.log 2>/dev/null
    command runremote "$@"
}
export -f runremote

function runremote-dev() {
    echo -e  "$(date +%s)\t$PWD\t$(history 1 | sed -r 's/^ +[0-9]+ +//' )" >> ${HOME}/logs/cmds/runremote-dev.log 2>/dev/null
    command runremote-dev "$@"
}
export -f runremote-dev
