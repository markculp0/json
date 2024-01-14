#!/bin/bash

jq '.' json/worldpopulation.json |head

jq '.' json/worldpopulation.json | less

jq '.|length' json/worldpopulation.json
# 195

jq '.|keys' json/worldpopulation.json
# 0-194 | Rank

jq -r '.[0]' json/worldpopulation.json

jq -r '.[].Rank' json/worldpopulation.json
# 1-195

jq -r '.[4].Rank, .[2].country' json/worldpopulation.json
# 5
# U.S.

# Country and population, top 3
for i in {0..2}; do 
  cat json/worldpopulation.json | jq --arg i $i '[.[$i|tonumber].country, .[$i|tonumber].population]'
done

