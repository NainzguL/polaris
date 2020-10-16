#!/bin/bash

args=()
for i in "$@"
do
case $i in
	-pwdfile=*)
    PWDFILE=`echo $i | sed 's/[-a-zA-Z0-9]*=//'`
    PWDARG="-password=$(cat $PWDFILE)"
	args+=($PWDARG)
    ;;
    *)
    args+=($i)
    ;;
esac
done

/flyway/flyway "${args[@]}"
