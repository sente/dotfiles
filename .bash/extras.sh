#!/bin/sh
# vim:set ft=sh et sw=4 sts=4:

function show_listening_programs ()
{
    sudo netstat -tupln | grep LISTEN | perl -p -e 's/ +/\t/g' | cut -f4,7 | sed 's/\/.*//' | while read line; do
        echo -ne "$line\t";
        set $line;
        ps -p $2 -o user,cmd | tail -n1;
    done | sort -k3 | columnate.awk -F'\t'
}




function count_chars ()
{
    awk '{ for (i=1;i<=length;i++) count[substr($0,i,1)]++; } END { for (i in count) printf "%s: %2d\n", i, count[i]; }'
}


function get_subreddit_pics ()
{
    subreddit=$1;
    curl -s -b reddit-cookie.txt "http://www.reddit.com/r/${subreddit}/.json?count=100" | json-tool | grep '"url"' | cut -f4 -d'"' | while read line; do
        echo "<a href=\"$line\"><img style=\"max-width:500px;max-height:500px;border:1px solid blue;\" src=\"$line\"></a>";
    done | postit ${subreddit}.html
}



function translate () 
{
    #stu@sente ~ $ translate "what time does school start?" en es
    #¿A qué hora empiezan la escuela?
    wget -qO- "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$1&langpair=$2|${3:-en}" | sed 's/.*"translatedText":"\([^"]*\)".*}/\1\n/';
}

function wordlength ()
{
    for i in "$@"; do echo "${#i} ${i}"; done
};

function most_recent_x ()
{
    prog="$1"
    num="$2"
    test -x `which $prog` || { echo $prog is not executable; return 1; }
    shift
    shift
    echo $files
    files="`ls -1t "$@" 2>/dev/null|head -$num`"
    echo "$prog" $files
    sleep 1
    "$prog" $files
}

function most_recent ()
{
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

function inpath ()
{
    [ -x "`which "$1" 2>/dev/null`" ];
}

function tar_out ()
{
    ( tar cf - "$@" )
}


function pwd_in_path ()
{
    DDD=$(readlink -e "$1")
    echo -e "$DDD\n$(pwd)"
    if [[ "$DDD" = "$(pwd)"* ]]; then echo "inpath"; else echo "NONONO"; fi
}

function pardir ()
{
    D=$1
    P=$(dirname "$D")
    if [ "$P" = "$D" ] ; then 
        return 0
    fi

    stat --printf "%F\t%n\n" "$P"
    
    pardir "$P"
}

function pgtree ()
{
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



function _diff ()
{
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


function char ()
{
    case "$1" in
        \') echo 39 ;;
        \\) echo 92 ;;
        ?) perl -e 'print ord('"'$1'"'), "\n"' ;;
        [0-9]?*) perl -e 'print chr('"$1"'), "\n"' ;;
        *) return 1 ;;
    esac ;
}

