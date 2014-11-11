#lists and reads all files into the environment

allfiles=list.files()
for(I in allfiles[2:length(allfiles)]){
assign(paste(sub(".491","",I)),fread(I))  
}
#

##Questionlist:

# 1) How much damage do magic dealers do relative to one another?
# a) Is Octavious worth awakening?
# Skill initial = mag_0040
# skill final = mag_0096
# -- Can i just merge together the HERO / ARMY / NAME / SKILL data into a tight sheet for people to use??
# HERO data:  Name = heroname Skill/SoldierTypesPerHero=ehero SkillData=eskill ArmyData=esoldier
# 2) What effects do various researches have?
# 3) "Corps researches"
# 4) Pantheon 4 difficulty equivalent in war (so we know when to move)
# 5) Pantheon/Pan4 completion rewards
# 6) Tax events
#Display text is in lang_en, event data is in etaxevent
#requitalTypeA1 of 1 = public sentiment valuea1 is how much it goes up
#type 8 is copper (or is it...it didnt show up..)

#7) Why is Indutiomarus so much harder in pantheon than  Tasgetius immediately before him?


heroname$V3[1:129]<-1
> heroname$V3[heroname$V1=="Andriskos"]<-1
> heroname$V3[heroname$V2=="Ashur Shurat"]<-1
> heroname$V3[heroname$V2=="Andriskos"]<-1
> heroname$V3[heroname$V2=="Ardassis I"]<-1
> grep("Ardassis I",heroname$V2)
[1] 506
> heroname$V3[heroname$V2=="Austin"]<-1
> heroname$V3[heroname$V2=="Barros"]<-1
> heroname$V3[heroname$V2=="Decebalus"]<-1
> heroname$V3[heroname$V2=="Gorgo"]<-1
> heroname$V3[heroname$V2=="Homujude"]<-1
> heroname$V3[heroname$V2=="Osarus I"]<-1
> heroname$V3[heroname$V2=="Patamaspatis"]<-1
> heroname$V3[heroname$V2=="Sanatruces II"]<-1
> heroname$V3[heroname$V2=="Shapur I"]<-1



##Current Progress:
#first subset to recruitables
#mergenonskill = everything that has no skill attack.  Need to look up the soldier ID to find out what their attacks actually are.
#mergedskill = everything that has a skill attack.  Has the appropriate skill data embedded w/soldier type info as well

#then should just have to merge those two and all will be happy again.
# HERO data:  Name = heroname Skill/SoldierTypesPerHero=ehero SkillData=eskill ArmyData=esoldier

#after some more cleaning