#!/bin/bash


read -p "Ваша фраза:" -r node
read -p "shift:" -r shft

declare -a str

while IFS="" read -r -n 1 x; do
  str+=("$x")
done <<<$node

res=()

for ((i = 0; i < ${#str[@]}; i++)); do

  ascii=$(printf "%d" "'${str[$i]}'")

  if (((($ascii >= 48)) && (($ascii <= 57)))); then

    res[$i]=$((9 - ${str[$i]}))

  elif (((($ascii >= 65)) && (($ascii <= 90)))); then

    num=$(($shft + $ascii - 64))
    new=$(($num % 26 + 64))

    if (($i % 2 != 0)); then
      new=$(($new + 32))
    fi

    res[$i]=$(printf "\\$(printf '%03o' "$new")")

  else

    res[$i]=${str[$i]}

  fi
done

for ((i = $((${#res[@]} - 1)); i >= 0; i--)); do
  if (($(printf "%d" "'${str[$i]}'") == 32)); then

    echo -n " "

  else

    echo -n ${res[$i]}

  fi
done

echo

exit 0
