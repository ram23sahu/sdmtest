#!/bin/bash
echo -n "enter lngth:  "
read len
echo -n "enter breadth: "
read br

area=`expr $len \* $br`
echo "area of rect: $area"


