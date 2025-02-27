[Manuscript link](https://doi.org/10.1094/PDIS-06-21-1253-RE)

``` r
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
```

## DON

``` r
plot1<-ggplot(datum, aes(Treatment,DON,fill=Cultivar))+
  geom_boxplot(outlier.shape = NA)+ #adding boxplot in figure but removing outliers(the black dots that popped up)
  geom_point(position=position_jitterdodge(dodge.width=0.9),shape=21,alpha=0.6)+#Adding jitter points over the boxplot
  scale_fill_manual(values = cbbPalette[c(2, 3)])+#filling the points and boxplots Cultivar with two colors from the cbbPallete 
  xlab("")+#Changing x label
  ylab("DON(ppm)")+#Changing y label
  facet_wrap(~Cultivar,scales="free")+#faceting by cultivar
  theme_classic() + #Using classic theme
  geom_pwc(aes(group=Treatment),method="t.test",label="{p.adj.format}{p.adj.signif}",hide.ns=T)#Using geom_pwc to do pairwise comparison and hiding non significant p values.
```

## 15ADON

``` r
# Change the y-variable to plot X15ADON and MassperSeed_mg. The y-axis label should now be “15ADON” and “Seed Mass (mg)”. Save plots made in questions 1 and 3 into three separate R objects. 
 plot2<-ggplot(datum, aes(Treatment,X15ADON,fill=Cultivar))+#Changing y variable to X15DON
   geom_boxplot(outlier.shape = NA)+
   geom_point(position=position_jitterdodge(dodge.width=0.9),shape=21,alpha=0.6)+
   scale_fill_manual(values = cbbPalette[c(2, 3)])+
   xlab("")+
   ylab("15ADON")+#Changing the label as per y variable used
   facet_wrap(~Cultivar,scales="free")+
   theme_classic()+
   geom_pwc(aes(group=Treatment),method="t.test",label="{p.adj.format}{p.adj.signif}",hide.ns=T)
```

## Seed mass

``` r
plot3<-ggplot(datum, aes(Treatment,MassperSeed_mg,fill=Cultivar))+#Changing y variable to MassperSpeed_mg
   geom_boxplot(outlier.shape = NA)+
   geom_point(position=position_jitterdodge(dodge.width=0.9),shape=21,alpha=0.6)+
   scale_fill_manual(values = cbbPalette[c(2, 3)])+
   xlab("")+
   ylab("Seed Mass (mg)")+#Changing y label as per y variable used
   facet_wrap(~Cultivar,scales="free")+
   theme_classic()+
   geom_pwc(aes(group=Treatment),method="t.test",label="{p.adj.format}{p.adj.signif}",hide.ns=T)
```

## Combined

``` r
# combining all three figures into one with three columns and one row.
figure <- ggarrange(plot1,plot2,plot3,labels = c("A","B","C"),nrow = 1,ncol = 3, common.legend = T)
```

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 10 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 2 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

``` r
figure
```

![](Coding_Challenge_4_files/figure-gfm/Combined-1.png)<!-- -->
