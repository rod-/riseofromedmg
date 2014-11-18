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
heroname$V3[heroname$V1=="Andriskos"]<-1
heroname$V3[heroname$V2=="Ashur Shurat"]<-1
heroname$V3[heroname$V2=="Andriskos"]<-1
heroname$V3[heroname$V2=="Ardassis I"]<-1
heroname$V3[heroname$V2=="Austin"]<-1
heroname$V3[heroname$V2=="Barros"]<-1
heroname$V3[heroname$V2=="Decebalus"]<-1
heroname$V3[heroname$V2=="Gorgo"]<-1
heroname$V3[heroname$V2=="Homujude"]<-1
heroname$V3[heroname$V2=="Osarus I"]<-1
heroname$V3[heroname$V2=="Patamaspatis"]<-1
heroname$V3[heroname$V2=="Sanatruces II"]<-1
heroname$V3[heroname$V2=="Shapur I"]<-1
#better: 
potentiallyrecruitable2<-subset(ebattlearmy[ebattlearmy$DropHeroRate!=0&ebattlearmy$DropHeroRate!=1,])
potentiallyrecruitable<-subset(ehero,Name%in%subset(heroname,Recruitable==1)$Name)
potentiallyrecruitable2$DispName<-ehero$DispName[match(potentiallyrecruitable2$EHeroID,ehero$idx)]

GoodOutput<-rbind(potentiallyrecruitable,subset(ehero,DispName%in%potentiallyrecruitable2$DispName))
GoodOutput<-unique(GoodOutput)
#220 recruitable heroes, where i had 218 in previous data...must have had some(-many!) dupes?
##Current Progress:
#first subset to recruitables

#mergenonskill = everything that has no skill attack.  Need to look up the soldier ID to find out what their attacks actually are.
#cleanup skillname
sname$SkillName<-as.character(sname$SkillName);sname$SkillName[28]<-"Normal Attack"
sname[93,]<-c("MAG_0096","OctaviusAwoken",96)
sname[94,]<-c("MAG_0073","AshurPoison",73)
sname[95,]<-c("MAG_0098","AwokenS.Scipio",98)
sname[96,]<-c("MAG_0069","Xerxes",69)
sname[97,]<-c("MAG_0071","Barros",71)
sname[98,]<-c("MAG_0070","Gorgo",70)
sname[99,]<-c("MAG_0068","AwokenS.Vavitis",68)
sname[100,]<-c("MAG_0065","Philopator",65)

#98,73,71,70,69,68,65 also don't work...

# HERO data:  Name = heroname Skill/SoldierTypesPerHero=ehero SkillData=eskill ArmyData=esoldier

#mergedskill = everything that has a skill attack.  Has the appropriate skill data embedded w/soldier type info as well
Temporary<-merge(GoodOutput,esoldier,by.y="Pants",by.x="ESoldierID")
tempsk<-subset(Temporary,IsSpirits==1)
tempsk<-((merge(tempsk,eskill,by.x="ESkillID.x",by.y="idx")))
tempsk<-(merge(tempsk,sname[,1:2],by="Name"))
#add on the skill names
temnsk<-subset(Temporary,IsSpirits==0)
temnsk<-merge(temnsk,eskill,by.x="ESkillID.y",by.y="idx")
temnsk<-merge(temnsk,sname[,1:2],by="Name")
GoodOutput<-rbind(tempsk,temnsk)
#Do some cleaning for Display
GoodDisplay<-GoodOutput[c("DispName","SkillName","SkillDamage","AwakeningLevel","SuccessRate","EnemyAddEffectID","EnemyAddEffectRate","EnemyRoundCount","CounterAttack","Resist","Evasion","Critical","EnemyRangeID","NormalAttacIncreaseRate","NormalDefenceDecreaseRate","SkillAttacIncreaseRate","SkillDefenceDecreaseRate","MagicAttacIncreaseRate","MagicDefenceDecreaseRate","LeaderShip","Brave","Intellect","SoldierCount","SoldierAddCount","NormalAttack","NormalDefence","SkillAttack","SkillDefence","MagicAttack","MagicDefence")]
