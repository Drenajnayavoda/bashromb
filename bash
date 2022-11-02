#! /bin/bash

#!/bin/bash

var1=$1
echo $var1
var2=$(($var1 / 2))
echo $var2
if ((var2*2 == var1))
then
var3=var2-1
else
var3=var2
fi
for ((i = 0; i < var1; i++))
do
for ((j = 0; j < var1; j++))
do
if ((i <= var3))
then
if((j >= var3 - i && j <= var3 + i))
then
echo -n "."
else
echo -n " "
fi
if ((var3!=var2 && i == var1))
then
for((a=0; a < var1+2;a++))
do
echo -n "."
done
fi
else
if ((j >= var3 + i - var1 + 1  && j <= var3 - i + var1 - 1))
then
echo -n "."
else
echo -n " "
fi
fi
done
echo " "
done

