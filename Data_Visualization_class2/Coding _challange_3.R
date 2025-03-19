#loading necessary libraries
library(ggplot2)
library(ggpubr)
#Reading the data and converting "na" strings to NA values
datum=read.csv("Data_Visualization_class1/MycotoxinData.csv",na.strings="na")

# Convert categorical variables to factors
datum$Treatment=as.factor(datum$Treatment)  # Convert treatment column to a categorical variable
datum$Cultivar=as.factor(datum$Cultivar)# Convert cultivar column to a categorical variable
datum$BioRep=as.factor(datum$BioRep) # Convert biological replicate column to a categorical variable

#Using colour blind palette
cbbPalette <- c( "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7","#000000")

##########Question 1
plot<-ggplot(datum, aes(Treatment,DON,fill=Cultivar,color=Cultivar))+
  geom_boxplot(outlier.shape = NA)+ #adding boxplot in figure but removing outliers(the black dots that popped up)
  geom_point(position=position_jitterdodge(dodge.width=0.9),shape=21,alpha=0.6)+#Adding jitter points over the boxplot
  scale_color_manual(values = cbbPalette[c(1, 4)])+#filling the points and boxplots Cultivar with two colors from the cbbPallete 
  scale_fill_manual(values=cbbPalette[c(2,3)])+
  xlab("")+#Changing x label
  ylab("DON(ppm)")+#Changing y label
  facet_wrap(~Cultivar,scales="free")+#faceting by cultivar
  theme_classic()#Using classic theme
plot

#Question number 2
#Change the factor order level so that the treatment “NTC” is first, followed by “Fg”, “Fg + 37”, “Fg + 40”, and “Fg + 70. 
 datum$Treatment_ordered=factor(datum$Treatment,levels=c("NTC","Fg", "Fg + 37", "Fg + 40","Fg+70")) #Reordering the Treatments as we want
 plot1<-ggplot(datum, aes(Treatment_ordered,DON,fill=Cultivar))+#Using the reordered levels of treatments
   geom_boxplot(outlier.shape = NA)+
   geom_point(position=position_jitterdodge(dodge.width=0.9),shape=21,alpha=0.6)+
   scale_fill_manual(values = cbbPalette[c(2, 3)])+# Apply color palette
   xlab("")+
   ylab("DON(ppm)")+
   facet_wrap(~Cultivar,scales="free")+
   theme_classic()
 plot1
 
####Question 3
# Change the y-variable to plot X15ADON and MassperSeed_mg. The y-axis label should now be “15ADON” and “Seed Mass (mg)”. Save plots made in questions 1 and 3 into three separate R objects. 
 plot2<-ggplot(datum, aes(Treatment,X15ADON,fill=Cultivar))+#Changing y variable to X15DON
   geom_boxplot(outlier.shape = NA)+
   geom_point(position=position_jitterdodge(dodge.width=0.9),shape=21,alpha=0.6)+
   scale_fill_manual(values = cbbPalette[c(2, 3)])+
   xlab("")+
   ylab("15ADON")+#Changing the label as per y variable used
   facet_wrap(~Cultivar,scales="free")+
   theme_classic()
 plot2
 
 plot3<-ggplot(datum, aes(Treatment,MassperSeed_mg,fill=Cultivar))+#Changing y variable to MassperSpeed_mg
   geom_boxplot(outlier.shape = NA)+
   geom_point(position=position_jitterdodge(dodge.width=0.9),shape=21,alpha=0.6)+
   scale_fill_manual(values = cbbPalette[c(2, 3)])+
   xlab("")+
   ylab("Seed Mass (mg)")+#Changing y label as per y variable used
   facet_wrap(~Cultivar,scales="free")+
   theme_classic()
 plot3
 
#####Question 4
# combining all three figures into one with three columns and one row. Setting the labels for the subplots as A, B and C
#Setting the option common.legend = T within ggarrange function
 figure <- ggarrange(plot,plot2,plot3,labels = c("A","B","C"),nrow = 1,ncol = 3, common.legend = T)
 figure 
##Using common.legend =T gives a common legend for all plots within ggarrange at once. But using common.legend=F would give separate legends for each plots.
 
################Question 5#########
#Using geom_pwc() to add t.test pairwise comparisons to the three plots made above
plot4<- plot+ 
   geom_pwc(aes(group=Treatment),method="t.test",label="{p.adj.format}{p.adj.signif}",hide.ns=T)#Using geom_pwc to do pairwise comparison and hiding non significant p values.
plot4 

plot5<- plot2+ 
  geom_pwc(aes(group=Treatment),method="t.test",label="{p.adj.signif}{p.adj.format}",hide.ns=T)
plot5 

plot6<- plot3+ 
  geom_pwc(aes(group=Treatment),method="t.test",label="{p.adj.format}{p.adj.signif}",hide.ns=T)
plot6 
# combining all three figures into one with three columns and one row.
figure2 <- ggarrange(plot4,plot5,plot6,labels = c("A","B","C"),nrow = 1,ncol = 3, common.legend = T)
figure2 
