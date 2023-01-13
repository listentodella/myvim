#!/bin/sh
#SH_DIR=$PWD/$(dirname $0)

if [ $# -eq 1 ]; then
    echo "default ARCH is 0, only ignore x86"
    ARCH=
else
    ARCH=$2
fi

SH_DIR=$PWD
TOP_DIR=$SH_DIR
src_dirs=$TOP_DIR
echo "src_dirs =" $src_dirs
echo "TOP_DIR =" $TOP_DIR

PRINT_FILE="-print"

find_c_sources()
{
    #    find $src_dirs -name "*.[chS]" -a -not -regex ".*x86_sdk.*" -not -type l $PRINT_FILE
    if [ ! $ARCH ]; then
        #echo "no arch specified, will ignore x86..."
        find $src_dirs -name "*.[chS]" -a -not -regex ".*x86_sdk.*" -not -type l $PRINT_FILE
    else
        #echo "ARCH =" $ARCH
        find $src_dirs -name "*.[chS]" -a -regex ".*$ARCH.*" -not -type l $PRINT_FILE
    fi
}

find_makefile()
{
    find $src_dirs -name Makefile -not -type l $PRINT_FILE
    find $src_dirs -name *.config -not -type l $PRINT_FILE
    find $src_dirs -name *.mk -not -type l $PRINT_FILE
}

find_sources()
{
    find_c_sources
    find_makefile
}

make_ctags()
{
    if [ -f tags ]; then
        rm tags
    fi
    if ! ctags --version | grep -iq exuberant ; then
        echo "ctags version mismatch!"
        exit 1
    fi
        find_sources | xargs ctags -a -I --extra=+f --c-kinds=+px \
            --regex-c='/^#?[ \t]?CONFIG_([a-zA-Z0-9_]+)/\1/'
}

make_cscope()
{
    if [ -f cscope.out ]; then
                rm cscope.*
    fi

    (echo \-k; echo \-q; find_sources) > cscope.files
    cscope -b -f cscope.out -i cscope.files
}


usage()
{
        echo "usage:"
        echo "$0 ctags ARCH_name"
        echo "$0 cscope ARCH_name"
}

if [ $# -eq 0 ]; then
        usage;
else
    case "$1" in
                "ctags")
                        make_ctags
                        ;;
                "cscope")
                        cd $TOP_DIR
                        make_cscope
                        ;;
    esac
fi
