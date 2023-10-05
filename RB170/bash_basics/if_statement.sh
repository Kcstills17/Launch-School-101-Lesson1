
integer=15

if [[ $integer -gt 10 ]] && [[ $integer -lt 20 ]]
then
  echo $integer is between 10 and 20
fi


int1=5
int2=10

if [[ $int1 -lt 7 ]] && [[ $int2 -gt 7 ]]
then
  echo 7 is between $int1 and $int2
fi


string1=zane
string2=john

if [[  $string1 != $string2 ]]
  then
    echo $string1 is not the same as $string2
else
    echo $string1 is the same as $string2
  fi

