damageatlevel<-function(indf,level){
  #assume max
 enemylevel<-level
  #assume damage formula = (SelfAtkStat/EnemyDefStat)*(atkval-defval)*(totalresist)/(totalmorale/100+100?)
  normaldamage<-(indf$NormalAttackIncreaseRate+1)*(indf$LeaderShip/deflookup(enemylevel)["LeaderShip"])*(atklookup(level)["Normal"]+indf$NormalAttack-deflookup(enemylevel)["Normal"])*stancemultiplier(level)*damagered(enemylevel)
  skilldamage<-indf$SkillDamage*(1+indf$SkillAttacIncreaseRate)*indf$Brave/deflookup(enemylevel)["Brave"]*(atklookup(level)["Skill"]+indf$SkillAttack-deflookup(enemylevel)["Skill"])*stancemultiplier(level)*damagered(enemylevel)
  elemdamage<-indf$SuccessRate*(1+indf$MagicAttacIncreaseRate)*indf$Intellect/defllookup(enemylevel)["Intellect"]*(atklookup(level)["Element"]+indf$MagicAttack-deflookup(enemylevel)["Element"])*stancemultiplier(level)*damagered(enemylevel)
  
  
}
atklookup<-function(level){
  nvec<-matrix(nrow=length(level),ncol=3);colnames(nvec)<-c("Normal","Skill","Element")
  nvec["Normal"]<-28*level
    nvec["Skill"]<-68*level
    nvec["Element"]<-13*level
  return(nvec)
}
deflookup<-function(enemylevel){
  nvec<-matrix(nrow=length(enemylevel),ncol=6,dimnames=list(c(),c("LeaderShip","Brave","Intellect","Normal","Skill","Element")))
  details<-lapply(subset(ebattlenpc,NPClevel==enemylevel))
  
}
