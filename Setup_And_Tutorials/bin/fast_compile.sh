#!/bin/bash

#
# Script for doing faster compilation by moving files
# to a faster local system directory such as /tmp
# and doing the compilation on them in there.
# 
# For use on BYU ECEn Digital Lab workstations.
#
# Requires the shell environment to already be prepared
# for building on the f4pga toolchain.
#

# name of current project directory
CURR_DIRNAME=`basename "$PWD"`

USAGE="
    Usage: ./fast_compile.sh [-h][-l]
    
    Options:
            -h  Help: Shows this help info.
            -l  Log: Logs output to a file (compile.log)"

# default log to null
LOG_FILE=/dev/null
# logging flag
LOGGING=0
# tmp directory to do faster compilation in
TMP_DIR=/tmp/${CURR_DIRNAME}

while getopts "hl" OPTION; do
    case $OPTION in
        h)
            # print help
            echo "$USAGE"
            exit 0
            ;;
        l)
            # set the logging file
            LOG_FILE=compile.log 
            # set logging flag
            LOGGING=1
            ;;
        *)
            echo "Incorrect options given"
            # print help after incorrect input
            echo "$USAGE"
            exit 1
            ;;
    esac
done

# check if build directory doesn't exist, if so make it
if [ ! -d "./build" ]
then
    echo "./build doesn't exist, creating local build directory"
    mkdir ./build
fi

# check if the tmp directory already exists, if so delete it
if [ -d "${TMP_DIR}" ]
then
    echo "${TMP_DIR} already exists, removing files for new compilation"
    rm -rf ${TMP_DIR}
fi

# create the tmp directory
mkdir ${TMP_DIR}

# copy relevant files over
cp ./*.v ${TMP_DIR}
cp ./*.sv ${TMP_DIR}
cp ./*.xdc ${TMP_DIR}
cp ./Makefile ${TMP_DIR}

# enter the tmp directory
cd ${TMP_DIR}
# run make in the tmp directory
SURELOG_CMD="-parse -DSYNTHESIS" make 2>&1 | tee ${LOG_FILE}

# return to original directory
cd -

# copy compile.log file back to current directory if logging
if [ $LOGGING == 1 ]
then
    cp ${TMP_DIR}/${LOG_FILE} . 
fi

# copy build files back to current build directory
cp -r ${TMP_DIR}/build/* ./build
