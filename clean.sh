#!/bin/bash

for i in "$@"
do
case $i in
    -h|--help)
        echo "./clean.sh [-h/--help]"
        exit 0
    ;;
    *)
        >&2 echo "Unknown option '$i', exiting."
        exit 1
    ;;
esac
done

rm -rf build/
exit $?
