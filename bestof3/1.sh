#!/bin/bash


words=()
x=0

for i in "$@"; do
       words[$x]="$i"
       x=$x+1
done

lenght=${#words[@]}

for ((i = 1; i <= lenght; i++)); do
        echo -n "${words[$(( $lenght-$i ))]} "
done

echo

exit 0



