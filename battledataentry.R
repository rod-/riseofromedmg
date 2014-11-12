

#just a bunch of data to compare rod7 to assayn during fights:

#choose a few heroes:  oenomaus: Level 1 on both, no adjs, etc
#cluentius: normal, diff level on both but could realistically get them to similar level w/diff #revives
#hannibal: has some different normal def modifiers as well as atk
#Quintus: has a skill atk, also has high crits and no "bonus" to normal atk.


#devise a series of tests that I want to make and keep things actually uniform in between:

# How does normal damage get calculated in the most basic case possible:
# - 
# How do the normalatk/normaldefense rates affect things? 
#
# How does morale affect the equation?

# What about StrongStamina?

# How are skill attacks calculated?
# how do "mixed" attacks work?  - Selekulos 

#4) How does Level affect things?
# lv 85 hannibal vs a couple of things ; lv 1 (post revive) hannibal vs same things, etcetc
#5) 
#Techlists below are as of experiment 14.  Strong stamina changes once
offensivetechlist<-c(87,54,52,87,75,52,69,32,10,17,7,12,10,0,0,11,14,0,16,0,0,0)
defensivetechlist<-c(67,65,62,87,87,87,82,36,11,11,11,11,13,17,12,16,30,17,39,3,0,0)

#Experiment 1: Q vs Q (naked lv1, one with fewer starting troops but better techs) - Offensive formation is Circular defensive is Inv.Def
#8:22
exp1<-data.frame(dam=c(122,194,294,174,10,249,100,97,220,139,16,184),
crit=c(0,0,1,0,0,0,0,0,0,0,1,0),
retal=c(0,0,1,0,0,0,1,0,0,0,0,0),
omorale=c(0,34,68,68,102,0,0,34,68,102,0,32),
skill=c(0,0,0,0,1,1,0,0,0,0,1,1),
otroopmax=c(rep(1340,12)),
dtroopmax=c(rep(1530,12)),
turn=c(1,2,2,2,1,2,2,2,1,2,1,2),
dform=c(rep("Invin",12)),
oform=c(rep("Circular",12)),
OffName="Quintus",
DefName="Quintus"
)
exp1<-handletechnology(fixformation(currenttroops(currentmorale(HeroStats(exp1)),weird = c(1142,0))),offensivetechlist,defensivetechlist)


#based on experiment 1, I think that the formula for skill damage is approximately as follows: admittedly there are few cases here.
#test$EstDam<-(test$SkillAttack-test$SkillDefence)*(1+test$crit)*test$SkillDamage*(0.5+(test$dtroopcurrent/test$dtroopmax))/(1+(test$dmorale/100))*(test$omorale/100)

#Experiment 2: Q vs Q (added a 61 normal defense crudeleatherarmor)(8:24)
exp2<-data.frame(dam=c(61,56,128,83,7,501,124),
crit=c(0,0,0,0,0,0,0),
retal=c(1,0,0,0,0,0,0),
skill=c(0,0,0,0,1,1,0),
otroopmax=1364,
dtroopmax=1530,
dform="Invin",
oform="Circular",
OffName="Quintus",
DefName="Quintus")
exp2<-handlegear(handletechnology(fixformation(currenttroops(currentmorale(HeroStats(exp2)),weird=c(1338,0))),offensivetechlist,defensivetechlist),Aggrogearlist = c(0,61,0,0,0,0),Defendergearlist = c(0,0,0,0,0,0,0))
#c(r61,56,128,83,pa7,pa501,124)
#omorale<-c(0,0,34,68,102,0,0)
#dmorale<-c(0,0,34,68,102,102,0)
#skill<-c(0,0,0,0,1,1,0)
#troopstart<-c(1364,192/1530)

#Experiment 3: Q vs Q (changed defense's formation from guard to skill atk) (8:28)
exp3<-data.frame(dam=c(55,37,352,57,11,357,201,44,251,179,15,37,223,51,16,222,51,34,224,48,11,195)
crit=c(0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0),
retal=c(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0),
skill=c(0,0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,0,1,1),
otroopmax=1364,
dtroopmax=1530,
oform="Circular",
dform="Wedge",
OffName="Quintus",
DefName="Quintus")
exp3<-handlegear(handletechnology(fixformation(currenttroops(currentmorale(HeroStats(exp3)))),offensivetechlist,defensivetechlist),Aggrogearlist = c(0,61,0,0,0,0),Defendergearlist = c(0,0,0,0,0,0,0))

#Experiment 4: repeat ( still skill atk form) 8:29
#c268,48,241,pa224,pa14,60c,330c,59,pa10,pa277,181,51,340,pa224,pa18c,c58,176
exp4<-data.frame(dam=c(268,48,241,224,14,60,330,59,10,277,181,51,340,224,18,58,176),
crit=c(1,0,0,0,0,1,1,0,0,0,0,0,0,0,1,1,0),
retal=0,
skill=c(0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0),
otroopmax=1364,
dtroopmax=1530,
oform="Circular",
dform="Wedge",
OffName="Quintus",
DefName="Quintus")
exp4<-handlegear(handletechnology(fixformation(currenttroops(currentmorale(HeroStats(exp4)))),offensivetechlist,defensivetechlist),Aggrogearlist = c(0,61,0,0,0,0),Defendergearlist = c(0,0,0,0,0,0,0))

#Experiment : Q vs O ( 8:33)
#exp5<-data.frame(dam=c(142,51,223,47,pa4,61,177,54,pa3,58,159,54,pa3,60,c235,56,pa3,61,243c,60,pa3,63,c222,58,pa3,64,139)
exp5<-data.frame(dam=c(142,51,223,47,4,61,177,54,3,58,159,54,3,60,235,56,3,61,243,60,3,63,222,58,3,64,139),
crit<-c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0),
skill<-c(0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0),
retal=0,
otroopmax=1364,
dtroopmax=1530,
oform="Circular",
dform="Wedge",
OffName="Quintus",
DefName="Oenomaus")
exp5<-handlegear(handletechnology(fixformation(currenttroops(currentmorale(HeroStats(exp5)))),offensivetechlist,defensivetechlist),Aggrogearlist = c(0,61,0,0,0,0),Defendergearlist = c(0,0,0,0,0,0,0))
#Experiment 5: Q vs O ( added a lv 1 21 atk sword to Q) 8:38
c(154,51,352c,49,pa4,60,166,55,pa3,65,169,56,pa3,65,256c,58,pa4c,66,152,60,pa3,64,153,60,pa3,67,214c)
crit<-c(0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,1)
skill<-c(0,0,0,01,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0)
troopstart<-c(1368,1530)
#Experiment 6: Q vs O ( added a lv 1 21 atk sword to O) 8:44
c(147,87,231,81,pa6c,97,186,84,pa4c,90,184,85,pa4,90,184,86)
(147,87,231,81,pa6c,97,186,84,pa4c,90,184,85,pa4,90,184,86,pa3,94,283c,84,pa4c,91,262c,78,pa3,91,161)
troopstart<-c(1368,1534)
#Experiment 7: Q vs O ( raised defensive Strong Stamina from 39 to 40) 8:50
c(211c,86,219c,77,pa4,99,185,90,pa4,95,271c,91,pa3,99,178,84,pa4c,90,179,82,pa4c,95,164,78,pa4c,84,168)
troopstart<-c(1368,1534)
defensivetechlist<-c(67,65,62,87,87,87,82,36,11,11,11,11,13,17,12,16,30,17,40,3,0,0)
#Experiment 8: Q vs O ( O level 15 (NewRecr9)) 8:58
c(187,224,206,189,pa1c,231,279c,199,pa1c,208,197,163,pa1c,165)
troopstart<-c(1368,1898)
#Experiment 9: Q vs O (Q lv 14 (New.Recr.8))8:58b
c(166,152,259,137,pa10c,157,330c,150,pa6,167,221,143,pa7,155,224,133,pa10c,145,222,125,pa7,132,217,114)
troopstart<-c(1706,1898)
#Experiment 10: Q vs O (Q +41 normal atk (lv 3 sword)) 8:59
c(168,160,268,144,pa7,162,342c,148,pa6,163,234,141,pa6,152,225,140,pa7,150,230,131,pa6,140,232,121)
troopstart<-c(1714,1898)
#EXperiment 11: Q vs O (Q +51 normal atk) 9:00
c(273c,157,399c,155,pa10c,183,c321,164,pa6,173,215,151,pa9c,159,232,140,pa6,145,219,134,pa6,145,215)
troopstart<-c(1718,1898)
#Experiment 12: Q vs o (Q lv 15) 9:10
c(179,145,299,135,pa9,157,229,144,pa8,158,252,136,pa12c,142,252,132,pa8,136,235,118,pa12c,130,220,115,pa10c,128)
troopstart<-c(1744,1898)
#Experiment 13: Q vs O (q + 341 skill atk (lv6 zebra)) 9:11
c(174,149,282,126,pa33,164,245,143,pa31,153,240,139,pa46c,155,235,129,pa31,145,230,120,pa28,142,221,114,pa27,122)
troopstart<-c(1768,1898)
#Experiment 14: Q vs O (q + 461 skill atk (lv 11 zebra), lv 16 q (N.R.9) 9:12
c(188,141,273,125,pa43,163,238,139,pa37,157,354c,141,pa54c,159,234,131,pa51c,149,223,130,pa33,150,298c)
troopstart<-c(1814,1898)
#Experiment 16: Q Vs O (q level 17 - N.R.10 644 satk (14greenzebra))  9:40
c(192,138,297,118,pa57,150,227,139,pa75c,147,228,138,pa47,146,229,130,pa46,140,346c,128,pa42,140,301c)
troopstart<-c(1878,1898)
#17: level 18 Q 9:40
c(273c,133,291,123,pa84c,160,222,143,pa70c,157,228,141,pa46,153,226,130,pa44,140,221,121,pa45,143,210)
troopstart<-c(1904,1898)


fixformation<-function(df){
  df$oform<-as.character(df$oform)
  df$dform<-as.character(df$dform)
  df$oform[df$turn==1]<-df$oform[1]
  df$dform[df$turn==1]<-df$dform[1]
  df$oform[df$turn==2]<-df$dform[1]
  df$dform[df$turn==2]<-df$oform[1]
  return(df)  }
#things that aren't relevant from MergedFinalOutput are removed and put into HeroDamageStats
#derive current troops
HeroStats<-function(df){
  #Don't want any extraneous columns merged in from HeroDamageStats...Just the right ones
  #also want it to be able to handle 2 diff guys!
  #don't really care that it's going to fail on awakenings though.
  df<-cbind(df,HeroDamageStats[c(rep(grep(df$OffName[1],HeroDamageStats$DispName)[1],length(df$dam))),c(2,3,4,8,9,10,11,12,13,14,15,16,18,19,20,21,22,23)])
  df$oLeaderShip<-df$LeaderShip
  df$oBrave<-df$Brave
  df$oIntellect<-df$Intellect
  df$dLeaderShip<-df$LeaderShip
  df$dBrave<-df$Brave
  df$dIntellect<-df$Intellect
  #start by using the offensive hero's stats for everything
  df[colnames(HeroDamageStats[c(2,3,4,8,9,10,11,13,15,18,20,22)])][df$turn==2,]<-HeroDamageStats[grep(df$DefName[1],HeroDamageStats$DispName)[1],c(2,3,4,8,9,10,11,13,15,18,20,22)]
  #set the defensive stats
  df$oLeaderShip[df$turn==2]<-df$LeaderShip[df$turn==2]
  df$oBrave[df$turn==2]<-df$Brave[df$turn==2]
  df$oIntellect[df$turn==2]<-df$Intellect[df$turn==2] #sets the offensive stats properly
  df$dLeaderShip[df$turn==1]<-df$LeaderShip[df$turn==2][1]
  df$dBrave[df$turn==1]<-df$Brave[df$turn==2][1]
  df$dIntellect[df$turn==1]<-df$Intellect[df$turn==2][1]
  #set the offensive stats to the defensive hero's off stats if turn==2
  df[colnames(HeroDamageStats[c(2,3,4,12,14,16,19,21,23)])][df$turn==1,]<-HeroDamageStats[grep(df$DefName[1],HeroDamageStats$DispName)[1],c(2,3,4,12,14,16,19,21,23)]
  #set the defensive stats to the defensive hero's def stats if turn==1
  
  #this is failing because it's overwriting 2,3,4 when i really want 2 copies of those stats.
  
  return(df)}
currenttroops<-function(df,weird=c(0,0)){
  #troopsstartatmaxtroops barring anything weird
  dtroopcurrent<-df$dtroopmax-weird[1]
  otroopcurrent<-df$otroopmax-weird[2]
  for(I in 2:length(df$dam)){
    if(df$turn[(I-1)]==1){
      dtroopcurrent[I]<-dtroopcurrent[I-1]-df$dam[I-1]
      otroopcurrent[I]<-otroopcurrent[I-1]
    }#then remove troops from defense and copy previous offense
    if(df$turn[(I-1)]==2){
      dtroopcurrent[I]<-dtroopcurrent[I-1]
      otroopcurrent[I]<-otroopcurrent[I-1]-df$dam[I-1]
    }
  }
  df$otroopcurrent<-otroopcurrent
  df$dtroopcurrent<-dtroopcurrent
  df$otroopcurrent[df$turn==2]<-dtroopcurrent[df$turn==2]
  df$dtroopcurrent[df$turn==2]<-otroopcurrent[df$turn==2]
  return(df)}
#this properly separates "D" and "O" the way i would like for modeling purposes.
currentmorale<-function(df){
  #moralestarts at 0
  moraleone<-rep(0,length(df$dam))
  moraletwo<-rep(0,length(df$dam))
  for(I in 2:length(df$dam)){
    if(df$skill[I-1]==0){
      if(df$retal[I-1]!=1){
        moraletwo[I]<-moraletwo[I-1]+34
        moraleone[I]<-moraleone[I-1]+34
      }
      else{moraleone[I]<-moraleone[I-1]
           moraletwo[I]<-moraletwo[I-1]}
      #raise morale for players (both get morale on hits - if they have it, and the lack of it is not yet implemented/considered)
    } #no skill, morale will go up somewhere (barring evades which i am not considering yet)
    if(df$skill[I-1]==1){
      if(df$turn[I-1]==1){moraleone[I]<-0;moraletwo[I]<-moraletwo[I-1]}
      if(df$turn[I-1]==2){moraletwo[I]<-0;moraleone[I]<-moraleone[I-1]}
    }
  }
  df$omorale<-moraleone
  df$omorale[df$turn==2]<-moraletwo[df$turn==2]
  df$dmorale<-moraletwo
  df$dmorale[df$turn==2]<-moraleone[df$turn==1]
  return(df)}
#derive current morale
handletechnology<-function(df,techlist,dtechlist){
  df$DamageReduction<-0
  df$NormalAttack[df$turn==1]<-df$NormalAttack[df$turn==1]+(10*techlist[1])
  df$NormalDefence[df$turn==2]<-df$NormalDefence[df$turn==2]+(7*techlist[4])
  df$SkillAttack[df$turn==1]<-df$SkillAttack[df$turn==1]+(25*techlist[3])
  df$SkillDefence[df$turn==2]<-df$SkillDefence[df$turn==2]+(15*techlist[5])
  df$MagicAttack[df$turn==1]<-df$MagicAttack[df$turn==1]+(35*techlist[6])
  df$MagicDefence[df$turn==2]<-df$MagicDefence[df$turn==2]+(16*techlist[7])
  df$NormalAttack[df$turn==2]<-df$NormalAttack[df$turn==2]+(10*dtechlist[1])
  df$NormalDefence[df$turn==1]<-df$NormalDefence[df$turn==1]+(7*dtechlist[4])
  df$SkillAttack[df$turn==2]<-df$SkillAttack[df$turn==2]+(25*dtechlist[3])
  df$SkillDefence[df$turn==1]<-df$SkillDefence[df$turn==1]+(15*dtechlist[5])
  df$MagicAttack[df$turn==2]<-df$MagicAttack[df$turn==2]+(35*dtechlist[6])
  df$MagicDefence[df$turn==1]<-df$MagicDefence[df$turn==1]+(16*dtechlist[7])
  df$DamageReduction[df$turn==1]<-df$DamageReduction[df$turn==1]+(0.0018*dtechlist[11])
  df$DamageReduction[df$turn==2]<-df$DamageReduction[df$turn==2]+(0.0018*techlist[11])
  df$formbonus<-0
  if(df$oform[df$turn==1][1]=="Siege"){
    df$formbonus[df$turn==1]<-.0075*techlist[10]}
  if(df$oform[df$turn==2][1]=="Siege"){
    df$formbonus[df$turn==2]<-.0075*dtechlist[10]}
  if(df$oform[df$turn==1][1]=="Wedge"){
    df$formbonus[df$turn==1]<-.0075*techlist[11]}
  if(df$oform[df$turn==2][1]=="Wedge"){
    df$formbonus[df$turn==2]<-.0075*dtechlist[11]}
  if(df$oform[df$turn==1][1]=="Snake"){
    df$formbonus[df$turn==1]<-.0075*techlist[14]}
  if(df$oform[df$turn==2][1]=="Snake"){
    df$formbonus[df$turn==2]<-.0075*dtechlist[14]}
  if(df$oform[df$turn==1][1]=="Hexagon"){
    df$formbonus[df$turn==1]<-.0075*techlist[16]}
  if(df$oform[df$turn==2][1]=="Hexagon"){
    df$formbonus[df$turn==2]<-.0075*dtechlist[16]}
  return(df)}
handlegear<-function(df,Aggrogearlist,Defendergearlist){
  #input gearlists are simply:  Normal Atk bonus, Normal Defence Bonus, Skill atk bonus, Skill Def Bonus, Magic Atk Bonus, Mag Def Bonus
df[turn==1,c("NormalAttack","NormalDefence","SkillAttack","SkillDefence","MagicAttack","MagicDefence")]<-t(t(df[turn==1,c("NormalAttack","NormalDefence","SkillAttack","SkillDefence","MagicAttack","MagicDefence")])+c(Aggrogearlist[1],Defendergearlist[2],Aggrogearlist[3],Defendergearlist[4],Aggrogearlist[5],Defendergearlist[6]))
df[turn==2,c("NormalAttack","NormalDefence","SkillAttack","SkillDefence","MagicAttack","MagicDefence")]<-t(t(df[turn==2,c("NormalAttack","NormalDefence","SkillAttack","SkillDefence","MagicAttack","MagicDefence")])+c(Defendergearlist[1],Aggrogearlist[2],Defendergearlist[3],Aggrogearlist[4],Defendergearlist[5],Aggrogearlist[6]))

return(df)}
  #maybe i'll make it more complicated later but for now i've got to get it started.
  
  
}