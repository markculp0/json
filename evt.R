
# main

library(jsonlite)

l <- fromJSON("evt.json", flatten = T)

df <- as.data.frame(l)

