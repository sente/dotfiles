#!/bin/sh
# vim:set ft=sh et sw=4 sts=4:

wordlength(){ for i in "$@"; do echo "${#i} ${i}"; done };

function most_recent_x() {
    prog="$1"
    num="$2"
    test -x `which $prog` || { echo $prog is not executable; return 1; }
    shift
    shift
    echo $files
    files="`ls -1t "$@" 2>/dev/null|head -$num`"
#    if [ -f "$file" ]; then
        echo "$prog" $files
        sleep 1
        "$prog" $files

#    else
#        "$prog"
#    fi
}
function most_recent() {
    prog="$1"
    test -x `which $prog` || { echo $prog is not executable; return 1; }
    shift
    file="`ls -1t "$@" 2>/dev/null|head -1`"
    if [ -f "$file" ]; then
        "$prog" "$file"
    else
        "$prog"
    fi
}

function inpath() { [ -x "`which "$1" 2>/dev/null`" ]; }

function tar_out() {
    ( tar cf - "$@" )
}

# stu@sente ~ $ pgpg ssh
#   PID USER      NI TT       STAT  STARTED COMMAND
#    1754 root       0 ?        Ss     Feb 15 /usr/sbin/sshd
#    27176 root       0 ?        Ss     Feb 27  \_ sshd: bobz [priv]
#    27179 bobz       0 ?        S      Feb 27  |   \_ sshd: bobz@pts/3
#    32190 root       0 ?        Ss   01:37:02  \_ sshd: stu [priv]
#    32192 stu        0 ?        S    01:37:03  |   \_ sshd: stu@notty
#     8868 root       0 ?        Ss   04:06:55  \_ sshd: stu [priv]

function pwd_in_path()
{
    DDD=$(readlink -e "$1")
    echo -e "$DDD\n$(pwd)"
    if [[ "$DDD" = "$(pwd)"* ]]; then echo "inpath"; else echo "NONONO"; fi
}

function pardir()
{
    D=$1
    P=$(dirname $D)
    if [ "$P" = "$D" ] ; then 
        return 0
    fi

    stat --printf "%F\t%n\n" "$P"
    
    pardir $P
}

function pgtree () {
    LESS="-FRSX#10"
    export LESS
    (
    arg="$1"; shift
    cols="pid,user,ni,tt,stat,start,command"
    if [ "`uname`" = Darwin ]; then
        ps axwwo $cols|head -1
        exec ps axwwo $cols |egrep -v 'grep\>|\<gp\>'|sed -ne '2,$p'|egrep "$arg" "$@"
    elif [ "`uname`" = Linux -o ! -x /usr/bin/ps ]; then
        ps fo $cols|head -1
        exec ps axfo $cols  |egrep -v 'grep\>|\<gp\>'|sed -ne '2,$p'|egrep "$arg" "$@"
    else
        /usr/bin/ps -f|head -1
        exec /usr/bin/ps -ef|egrep -v 'grep\>|\<gp\>'|sed -ne '2,$p'|egrep "$arg" "$@"
    fi
    ) | pager
}



function _diff(){
    PATH="`echo $PATH|sed -e "s,\\($HOME/bin\\):\\(.*\\),\\2:\\1,"`"
    if [ -t 1 ]; then
        if inpath git; then
            [ "x-uN" = "x$1" ] && shift
            exec git diff --no-index "$@"
        else
            exec diff -uprN "$@" | pager
        fi
    else
        exec diff "$@"
    fi ;
}


function char(){
case "$1" in
    \') echo 39 ;;
    \\) echo 92 ;;
    ?) perl -e 'print ord('"'$1'"'), "\n"' ;;
    [0-9]?*) perl -e 'print chr('"$1"'), "\n"' ;;
    *) return 1 ;;
esac ;
}

