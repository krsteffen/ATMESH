#!/bin/bash

for i in "$@"
do
case $i in
    -h|--help)
        echo "./build.sh [-h/--help] [VERBOSE=0/1]"
        exit 0
    ;;
    VERBOSE=*)
        VERBOSITY="${i#*=}"
        if [[ "$VERBOSITY" == 0 ]]
        then
            unset VERBOSITY
        elif [[ "$VERBOSITY" == 1 ]]
        then
            : # empty statement
        else
            echo "Warning: VERBOSE must equal 0 or 1; defaulting to 0."
            unset VERBOSITY
        fi
    shift # past argument=value
    ;;
    *)
        >&2 echo "Unknown option '$i', exiting."
        exit 1
    ;;
esac
done

mkdir -p build && cd build
cmake -DCMAKE_MODULE_PATH=$(pwd)/../../CMakeModules/Modules -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DCMAKE_Fortran_COMPILER=ifort ..
if [ $? -eq 0 ]; then
    # Previous command ran successfully
    make VERBOSE=$VERBOSITY
    exit $?
else
    exit 1
fi
