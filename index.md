
***

### JSON JQ

***

* -r = output raw strings 

* -c = output compact json

***

##### Getting information

***

```
    # Pretty print
    jq '.' events.json | head
    
    # Compact it
    jq -c '.' events.json > evt.json
    
    # Down one level
    jq '.[]' events.json
    
    # Get # of events 
    jq '.events|length' events.json
    
    # Get keys 
    jq -r '.|keys' events.json
    
    # List by ID and name
    jq '.[] | {id: .id, name: .name}' json/donut.json 
    
    # Get all 'name' fields
    jq -r '.events[].changes[].name' events.json
    
    # All combinations of batter and topping
    jq -r '.[] | {batter: .batters.batter[].type, topping: .topping[].type}' json/donut.json

    # Get the entire pretty event matching Sue in current field
    jq '.events[] | select(.changes[].current == "Sue")' events.json
    
    # Get id, time, changes fields matching Sue in current field
    jq '.events[] | select(.changes[].current == "Sue") | [.id, .time, .changes[]]' events.json

```

***

##### Loops

***

```
    #!/bin/bash 
    
    f=`cat events.json`
    
    # Single argument
    for i in {0..1}; do
      echo $f | jq -r --arg i $i '.events[0] | "\(.changes[$i|tonumber].name): \(.changes[$i|tonumber].current)"'
    done
    
    # Country and population, top 3
    for i in {0..2}; do 
      cat json/worldpopulation.json | jq --arg i $i '[.[$i|tonumber].country, .[$i|tonumber].population]'
    done
    
    # Multiple arguments format
    for i in {0..1}; do 
      echo $f | jq -r '.events[0] | "\(.changes[$ARGS.positional[0]|tonumber].name): \(.changes[$ARGS.positional[0]|tonumber].current)"' --args $i
    done

    # Nested loop, multiple arguments
    for j in {0..2}; do
      for i in {0..1}; do
        echo $f | jq -r '.events[$ARGS.positional[1]|tonumber] | "\(.changes[$ARGS.positional[0]|tonumber].name): 
          \(.changes[$ARGS.positional[0]|tonumber].current)"' --args $i $j
      done
    done     

```


***
***
