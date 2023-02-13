#!/bin/bash -e

method1 () {
  IFS=', ' read -r -a V1 <<< "$1"

  length=${#1}
  i=$((length-1))
  while [ $i -ge 0 ]
  do
    V2=$V2${1:$i:1}
    i=$((i-1))
  done

  if [ $V2 == $V1 ]; then
    echo "true"
  else
    echo "false"
  fi
}

method2 () {
  _R=0
  for (( c=$1; c<=$2; c++ ))
  do
    if [ $((c%2)) -eq 1 ]; then
      _R=$(( _R + c))
    fi
  done
  echo $_R
}

method3 () {
  vs1=$(echo $1 | grep -o . | sort |tr -d "\n")
  vs2=$(echo $2 | grep -o . | sort |tr -d "\n")

  if [ $vs1 == $vs2 ]; then
    echo "true"
  else
    echo "false"
  fi
}
