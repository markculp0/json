#!/bin/bash 

f=`cat json/events.txt`

# Single argument
# for i in {0..1}; do 
#   echo $f | jq -r --arg i $i '.events[0] | "\(.changes[$i|tonumber].name): \(.changes[$i|tonumber].current)"' 
# done

# Multiple arguments format
# for i in {0..1}; do 
#   echo $f | jq -r '.events[0] | "\(.changes[$ARGS.positional[0]|tonumber].name): \(.changes[$ARGS.positional[0]|tonumber].current)"' --args $i
# done

# Nested loop, multiple arguments
echo "---"
for j in {0..2}; do
  for i in {0..1}; do
    echo $f | jq -r '.events[$ARGS.positional[1]|tonumber] | "\(.changes[$ARGS.positional[0]|tonumber].name): \(.changes[$ARGS.positional[0]|tonumber].current)"' --args $i $j
  done
  echo "---"
done  



