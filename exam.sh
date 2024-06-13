#!/bin/bash
# Function to check if a number is a palindrome
is_palindrome() {
local num=$1
local rev_num=$(echo $num | rev)
if [ "$num" == "$rev_num" ]; then
echo 1
else
echo 0
fi
}
# Function to calculate the sum of digits
sum_of_digits() {
local num=$1
local sum=0
while [ $num -gt 0 ]; do
sum=$((sum + num % 10))
num=$((num / 10))
done
echo $sum
}
# Function to transform words
transform_words() {
local file=$1
local words=()
# Read file into array
while IFS= read -r line; do
words+=("$line")
done < "$file"
# Transform words
for i in "${!words[@]}"; do
words[$i]=$(echo "${words[$i]}" | sed 's/n/./g')
done
}
# Display transformed words
echo "${words[@]}"
# Menu-driven script
while true; do
echo "Select an option:"
echo "1. Enter a 4-digit number and display the sum of digits if it is not a palindrome."
echo "2. Transform words from a file."
echo "3. Exit."
read -p "Enter your choice: " choice
case $choice in
1)
esac
done
read -p "Enter a 4-digit number: " number
if [ $(is_palindrome $number) -eq 1 ]; then
echo "The number is a palindrome."
else
sum=$(sum_of_digits $number)
echo "The sum of the digits is: $sum"
fi
;;

2)
read -p "Enter the filename: " filename
if [ -f "$filename" ]; then
transform_words $filename
else
echo "File not found."
fi
;;

3)
echo "Exiting..."
break
;;
*)

echo "Invalid choice. Please select a valid option."
;;


#chmod +x menu.sh
#./menu.sh
