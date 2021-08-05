#!/bin/bash
echo "Number to polynomial converter"
echo -e "(writes unnecessary plus at end for every polynomial):\n"

#For every line check count of numbers
cat data.txt | tr -d " \t" > tmp.txt #parse file to tmp.txt file without spaces

#Count characters in every line from data.txt
#sed -n '1p' tmp.txt | wc -m #counts with newline characters (if want use have to subtract them)
echo -n "Count of lines in file:"
wc -l < tmp.txt
len=$(wc -l < tmp.txt)
#sed -n '1p' tmp.txt | wc -m #returns count od characters in first line (with newline character)

for (( a=1;a<=len;a++)) ;
do 
    maxPower=$(sed -n -e "${a}"p tmp.txt | wc -m);#check length of each line
    ((maxPower-=2));#substract newline characters
    line=$(sed -n -e "${a}"p data.txt);#line of text with delimiters from original
    power=$maxPower;
    for (( b=1;b<=$(( maxPower+1 ));b++ ));
    do
    character=$(echo "$line" | cut -d' ' -f "$b");#divide characters and write proper power
        if [ ! "$character" -eq 0 ];
        then echo -n "$character""x^""$power""+";
        fi
    ((power-=1));
done;
echo;
done
rm -rf tmp.txt
