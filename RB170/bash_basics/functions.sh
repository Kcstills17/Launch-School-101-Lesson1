greeting () {
  echo Hello $1
}

greeting 'Peter' # outputs 'Hello Peter'


sum () {
 echo "The sum of $1 and $2 is $(($1 + $2))"
}

sum 5 7
