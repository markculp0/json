#!/bin/bash

curl 'https://api.github.com/repos/markculp0/json/commits?per_page=5' >json/commits.json

jq '.[]|length' json/commits.json
# 9

jq -r '.[]|keys' json/commits.json
# [
#   "author",
#   "comments_url",
#   "commit",
#   "committer",
#   "html_url",
#   "node_id",
#   "parents",
#   "sha",
#   "url"
# ]

# Get author login and url
jq '{login: .[0].author.login, url: .[0].author.url}' json/commits.json 
# {
#   "login": "markculp0",
#   "url": "https://api.github.com/users/markculp0"
# }

# Get commit dates and messages
jq '{date: .[].commit.committer.date, message: .[].commit.message}' json/commits.json
# {
#   "date": "2024-01-14T16:04:05Z",
#   "message": "init commit"
# }

# Get issues 
curl 'https://api.github.com/repos/markculp0/json/issues'

# Get repos
curl -L 'https://api.github.com/users/markculp0/repos' 




