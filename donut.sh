#!/bin/bash

jq '.' json/donut.json

jq '.|length' json/donut.json

jq '.|keys' json/donut.json

# List by ID and name
jq '.[] | {id: .id, name: .name}' json/donut.json 

# All combinations of batter and topping
jq -r '.[] | {batter: .batters.batter[].type, topping: .topping[].type}' json/donut.json

# Counts, in descending order, toppings used by each donut type
jq -r '.[].topping[].type' json/donut.json | sort | uniq -c | sort -rn

# Enumerate the data set
echo "---"
for i in {0..2}; do
  jq -r --arg i $i '.[$i|tonumber].id' json/donut.json
  jq -r --arg i $i '.[$i|tonumber].type' json/donut.json
  jq -r --arg i $i '.[$i|tonumber].name' json/donut.json
  echo "- Batter"
  jq -r --arg i $i '.[$i|tonumber] | .batters.batter[].type' json/donut.json
  echo "-- Topping"
  jq -r --arg i $i '.[$i|tonumber].topping[].type' json/donut.json
  echo "---"
done


