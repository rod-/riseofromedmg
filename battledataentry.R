

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
defensivetechlist<-c(67,65,62,87,87,87,82,36,11,11,11,11,13,17,12,16,30,17,40,3,0,0)

#Experiment 1: Q vs Q (naked lv1, one with fewer starting troops but better techs) - Offensive formation is Circular defensive is Inv.Def
#8:22
dam<-c(122,194,rc294,174,pa10,pa249,r100,97,220,139,pa16c,pa184)
crit<-c(0,0,1,0,0,0,0,0,0,0,1,0)
retal<-c(0,0,1,0,0,0,1,0,0,0,0,0)
omorale<-c(0,34,68,68,102,0,0,34,68,102,0)
skill<-c(0,0,0,0,1,1,0,0,0,0,1,1)
troopstart<-c(1340,388/1530)
#Experiment 2: Q vs Q (added a 61 normal defense crudeleatherarmor)(8:24)
c(r61,56,128,83,pa7,pa501,124)
omorale<-c(0,0,34,68,102,0,0)
dmorale<-c(0,0,34,68,102,102,0)
skill<-c(0,0,0,0,1,1,0)
troopstart<-c(1364,192/1530)
#Experiment 3: Q vs Q (changed defense's formation from guard to skill atk) (8:28)
dam<-c(55,37,352,57,11,357,201,44,251,179,15,37,223,51,16,222,51,34,224,48,11,195)
crit<-c(0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0)
resist<-c(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0)
skill<-c(0,0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,0,1,1)
troopstart<-c(1364,1530)
#i am not including morale here but can i probably just figure out a way to calculate it from the attacks rather than watching?

#Experiment 4: repeat ( still skill atk form) 8:29
c268,48,241,pa224,pa14,60c,330c,59,pa10,pa277,181,51,340,pa224,pa18c,c58,176
dam<-c(268,48,241,224,14,60,330,59,10,277,181,51,340,224,18,58,176)
crit<-c(1,0,0,0,0,1,1,0,0,0,0,0,0,0,1,1,0)
resist<-0
skill<-c(0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0)
troopstart<-c(1364,1530)
#Experiment : Q vs O ( 8:33)
c(142,51,223,47,pa4,61,177,54,pa3,58,159,54,pa3,60,c235,56,pa3,61,243c,60,pa3,63,c222,58,pa3,64,139)
crit<-c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0)
skill<-c(0,0,0,01,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0)
troopstart<-c(1364,1530)
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