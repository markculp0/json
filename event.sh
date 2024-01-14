
# main 

jq '.' json/events.json

# Compact it
jq -c '.' json/events.json > json/evt.json

# Down one level
jq '.[]' json/events.json

# Get # of events 
jq '.events|length' json/events.json

# Get keys 
jq -r '.|keys' json/events.json

# Get all 'name' fields
jq -r '.events[].changes[].name' json/events.json

# Get the entire event matching Sue in current field
jq '.events[] | select(.changes[].current == "Sue")' json/events.json

# Get id and time fields matching Sue in current field
jq '.events[] | select(.changes[].current == "Sue") | [.id, .time, .changes[]]' json/events.json



