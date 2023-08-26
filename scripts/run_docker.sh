#!/bin/bash

function print_help {
    cat << EOF -
Available options:"
 [build|run]

 Description:
     [build]  Build docker image

     [run] Run docker image as a container
EOF
}

if [ $# -lt 1 ]
then
    print_help
    exit 0
fi

function build {
    cmd="docker build --tag lets-orgasm ."
    echo $cmd
    eval $cmd
}

function run {
    cmd="docker run -it -p 8080:80 --rm --name lets-orgasm-container lets-orgasm:latest"
    echo $cmd
    eval $cmd
}


case ${1} in
    build)
        build
        ;;
    run)
        run
        ;;
esac