#Reading the data and converting "na" strings to NA values
datum=read.csv("https://raw.githubusercontent.com/ArpanPrj/Reproducibility2025/refs/heads/main/Data_Visualization_class1/MycotoxinData.csv",na.strings="na")

# Convert categorical variables to factors
datum$Treatment=as.factor(datum$Treatment)  # Convert treatment column to a categorical variable
datum$Cultivar=as.factor(datum$Cultivar)# Convert cultivar column to a categorical variable
datum$BioRep=as.factor(datum$BioRep) # Convert biological replicate column to a categorical variable

cbbPalette <- c( "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7","#000000")

##########Question 1
plot<-ggplot(datum, aes(Treatment,DON,fill=Cultivar))+
  geom_boxplot(outlier.shape = NA)+
  geom_point(position=position_jitterdodge(dodge.width=0.9),shape=21,alpha=0.6)+
  scale_fill_manual(values = cbbPalette[c(2, 3)])+# Apply color palette
  xlab("")+
  ylab("DON(ppm)")+
  facet_wrap(~Cultivar,scales="free")+
  theme_classic()
plot

#Change the factor order level so that the treatment “NTC” is first, followed by “Fg”, “Fg + 37”, “Fg + 40”, and “Fg + 70. 
 datum$Treatment_ordered=factor(datum$Treatment,levels=c("NTC","Fg", "Fg + 37", "Fg + 40","Fg+70"))
 plot1<-ggplot(datum, aes(Treatment_ordered,DON,fill=Cultivar))+
   geom_boxplot(outlier.shape = NA)+
   geom_point(position=position_jitterdodge(dodge.width=0.9),shape=21,alpha=0.6)+
   scale_fill_manual(values = cbbPalette[c(2, 3)])+# Apply color palette
   xlab("")+
   ylab("DON(ppm)")+
   facet_wrap(~Cultivar,scales="free")+
   theme_classic()
 plot1

# Change the y-variable to plot X15ADON and MassperSeed_mg. The y-axis label should now be “15ADON” and “Seed Mass (mg)”. Save plots made in questions 1 and 3 into three separate R objects. 
 plot2<-ggplot(datum, aes(Treatment,X15ADON,fill=Cultivar))+
   geom_boxplot(outlier.shape = NA)+
   geom_point(position=position_jitterdodge(dodge.width=0.9),shape=21,alpha=0.6)+
   scale_fill_manual(values = cbbPalette[c(2, 3)])+# Apply color palette
   xlab("")+
   ylab("15ADON")+
   facet_wrap(~Cultivar,scales="free")+
   theme_classic()
 plot2
 
 plot3<-ggplot(datum, aes(Treatment,MassperSeed_mg,fill=Cultivar))+
   geom_boxplot(outlier.shape = NA)+
   geom_point(position=position_jitterdodge(dodge.width=0.9),shape=21,alpha=0.6)+
   scale_fill_manual(values = cbbPalette[c(2, 3)])+# Apply color palette
   xlab("")+
   ylab("Seed Mass (mg)")+
   facet_wrap(~Cultivar,scales="free")+
   theme_classic()
 plot3
 
 library(ggpubr)
 figure <- ggarrange(plot,plot2,plot3,labels = c("A","B","C"),nrow = 1,ncol = 3, common.legend = T)
 figure 
 
 
################
 
plot4<- plot+ 
   geom_pwc(aes(group=Treatment),method="t.test",label="{p.adj.format}{p.adj.signif}",hide.ns=T)
plot4 

plot5<- plot2+ 
  geom_pwc(aes(group=Treatment),method="t.test",label="{p.adj.format}{p.adj.signif}",hide.ns=T)
plot5 

plot6<- plot3+ 
  geom_pwc(aes(group=Treatment),method="t.test",label="{p.adj.format}{p.adj.signif}",hide.ns=T)
plot6 

figure2 <- ggarrange(plot4,plot5,plot6,labels = c("A","B","C"),nrow = 1,ncol = 3, common.legend = T)
figure2 
