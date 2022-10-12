#!/bin/bash

var1=$1
echo $var1
var2=$(($var1 / 2))
echo $var2
for ((i = 0; i < var1; i++))
do
for ((j = 0; j < var1; j++))
do
if ((i <= var2))
then
if((j >= var2 - i && j <= var2 + i))
then
echo -n "."
else
echo -n " "
fi
else
if ((j >= var2 + i - var1 + 1 && j <= var2 - i + var1 - 1))
then
echo -n "."
else
echo -n " "
fi
fi
done
echo " "
done
