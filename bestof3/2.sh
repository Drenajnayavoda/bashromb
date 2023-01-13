#!/bin/bash

array=()
x=0

for w in $*; do
        array[$x]=$w
        x=$x+1
done

if (( ${#array[@]} == 0)); then
        echo "z"
        exit 0
fi

res=0

for ((i = 0; i < ${#array[@]}; i++)); do
        ascii=$(printf "%d" "'${array[$i]}'")
        res=$(( $res + $ascii - 96 ))
done

x=0

if (( $res/25 > 0 )); then
        x=1
fi

new=$(( $res % 26 + 96))

if (( $x == 1)); then
        printf "\\$(printf '%03o' "$new")"
        echo " // прерполнение"

else
        printf "\\$(printf '%03o' "$new")"
        echo
fi

echo

exit 0
