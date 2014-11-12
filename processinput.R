#attempts to convert the data i input on the google sheet into usable modeling data...

#First need to convert the unit class into army level
lookuparmylevel<-function(input){
  #g
  as.double(armynamelevel$uid[match(input,armynamelevel$V2)])
  
}
#second need to lookup the enemy stats
enemystatlookup<-function(input){
  return(ebattlenpc[match(npcnames$V1[npcnames$V2==input],ebattlenpc$Name),])
  
} #this function does not handle ambiguities at all.  I'd like it to, but it doesn't.  Just Don't pass it any ambiguous names, for now.
#third need to collate the total unit stats
