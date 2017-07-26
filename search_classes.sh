#!/bin/bash  

function matchClass()
{
   echo "current class is:"$1
   echo "match start"
   CLASS=`egrep $2 $1`
   if [ "$CLASS" != "" ]
   then
      echo "Current class is "$1 >> $3
      echo "Depend on classes:" >> $3	
      egrep $2 $1 >> $3
      echo "\n" >> $3
   else
      echo "match null"
   fi
   echo "match end" 
}

function ergodic()
{
  for file in `ls $1`
  do
    if [ -d $1"/"$file ] 
    then
       ergodic $1"/"$file
    else
       matchClass $1"/"$file $2 $3
    fi
  done
}

INIT_PATH=$1
MATCH_RULE=$2
PRINT_PATH=$3  
ergodic $INIT_PATH $MATCH_RULE $PRINT_PATH 
