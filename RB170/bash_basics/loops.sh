echo while loop
echo ..........

counter=0
max=25

while [[ $counter -le $max ]]
do
  echo $counter
  ((counter++))
done

echo until loop
echo .........

counter2=25
min=0

until [[ $counter2 -lt $min ]]
do
  echo $counter2
  ((counter2--))
done


echo for loop
echo ........

numbers='1 2 3 4 5 6 7 8 9 10'

for number in $numbers
do

  ((number++))
  echo $number
done
