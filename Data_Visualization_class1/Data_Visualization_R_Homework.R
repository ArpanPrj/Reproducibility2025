#Reading the data and converting "na" strings to NA values
datum=read.csv("https://raw.githubusercontent.com/ArpanPrj/Reproducibility2025/refs/heads/main/Data_Visualization_class1/MycotoxinData.csv",na.strings="na")

# Convert categorical variables to factors
datum$Treatment=as.factor(datum$Treatment)  # Convert treatment column to a categorical variable
datum$Cultivar=as.factor(datum$Cultivar)# Convert cultivar column to a categorical variable
datum$BioRep=as.factor(datum$BioRep) # Convert biological replicate column to a categorical variable


#####Question 2######
# --- Basic boxplot ---
library(ggplot2)
plot1<-ggplot(datum, aes(Treatment,DON,colour = Cultivar))+ # Map treatment to x, DON to y, and color to Cultivar
         geom_boxplot()+# Add a boxplot layer
         xlab("")+# Remove x-axis label
         ylab("DON(ppm)")# Change y-axis label
plot1

######Question 3######
# --- Bar Chart with standard error bars ---
plot2<-ggplot(datum, aes(Treatment,DON,colour = Cultivar,fill=Cultivar))+ 
  stat_summary(fun=mean,geom="bar",position="dodge")+ # Plot bars for mean DON values,and dodging them 
  stat_summary(fun.data=mean_se,geom="errorbar", position="dodge")+ # Add error bars using standard error
    xlab("")+
  ylab("DON(ppm)")
plot2

#####Question 4########
# --- Bar Chart with data points overlaid ---
plot3<-ggplot(datum, aes(Treatment,DON,fill=Cultivar))+
       stat_summary(fun=mean,geom="bar",position="dodge",colour="black")+ #plot the data by mean and dodge it
  stat_summary(fun.data=mean_se,geom="errorbar", position="dodge")+#Adding error bars 
  xlab("") +
  xlab("")+
  ylab("DON(ppm)")+
  geom_point(aes(fill=Cultivar),position=position_jitterdodge(dodge.width=0.9),shape=21,colour = "black")# Jittering points
 
plot3
# --- Boxplot with overlaid data points ---
plot4<-ggplot(datum, aes(Treatment,DON,fill=Cultivar))+
  geom_boxplot(colour="black")+ # Boxplot with black outline
  xlab("")+
  ylab("DON(ppm)")+
  geom_point(position=position_jitterdodge(dodge.width=0.9),shape=21,colour="black") # Jittered points
plot4

######Question 5######
# Define a colorblind-friendly palette
cbbPalette <- c( "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7","#000000")

# --- Boxplot with colorblind-friendly palette ---
plot5<-ggplot(datum, aes(Treatment,DON,fill=Cultivar))+
  geom_boxplot(colour="black")+
  scale_fill_manual(values = cbbPalette)+# Apply color palette
  xlab("")+
  ylab("DON(ppm)")+
  geom_point(position=position_jitterdodge(dodge.width=0.9),shape=21,colour="black")
  
plot5
# --- Bar Chart with colorblind-friendly palette ---
plot6<-ggplot(datum, aes(Treatment,DON,fill=Cultivar))+
  stat_summary(fun=mean,geom="bar",position="dodge",colour="black")+ #plot the data by mean and dodge it
  stat_summary(fun.data=mean_se,geom="errorbar", position="dodge")+
  xlab("")+
  ylab("DON(ppm)")+
  geom_point(aes(fill=Cultivar),position=position_jitterdodge(dodge.width=0.9),shape=21)+
  scale_fill_manual(values = cbbPalette)

plot6

######Question 6#####
# --- Boxplot faceted by cultivar ---
plot7<-ggplot(datum, aes(Treatment,DON,fill=Cultivar))+
  geom_boxplot(colour="black")+
  scale_fill_manual(values = cbbPalette)+
  xlab("")+
  ylab("DON(ppm)")+
  geom_point(position=position_jitterdodge(dodge.width=0.9),shape=21,colour="black")+
  facet_wrap(~Cultivar)# Create separate panels for each Cultivar

plot7
# --- Bar Chart faceted by cultivar ---
plot8<-ggplot(datum, aes(Treatment,DON,fill=Cultivar))+
  stat_summary(fun=mean,geom="bar",position="dodge",colour="black")+ #plot the data by mean and dodge it
  stat_summary(fun.data=mean_se,geom="errorbar", position="dodge")+
  xlab("")+
  ylab("DON(ppm)")+
  geom_point(aes(fill=Cultivar),position=position_jitterdodge(dodge.width=0.9),shape=21,colour = "black")+
  scale_fill_manual(values = cbbPalette)+
  facet_wrap(~Cultivar)# Create separate panels for each Cultivar

plot8

########Question 7######
# --- Boxplot with transparency (alpha) ---
plot9<-ggplot(datum, aes(Treatment,DON,fill=Cultivar))+
  geom_boxplot(colour="black")+
  scale_fill_manual(values = cbbPalette)+
  xlab("")+
  ylab("DON(ppm)")+
  geom_point(position=position_jitterdodge(dodge.width=0.9),shape=21,colour="black",alpha=0.5)+ #Creating semi-transparent points by changing aplha
  facet_wrap(~Cultivar)

plot9
# --- Bar Chart with transparency---
plot10<-ggplot(datum, aes(Treatment,DON,fill=Cultivar))+
  stat_summary(fun=mean,geom="bar",position="dodge",colour="black")+ #plot the data by mean and dodge it
  stat_summary(fun.data=mean_se,geom="errorbar", position="dodge")+
  xlab("")+
  ylab("DON(ppm)")+
  geom_point(aes(fill=Cultivar),position=position_jitterdodge(dodge.width=0.9),shape=21,colour = "black",alpha=0.5)+
  scale_fill_manual(values = cbbPalette)+
  facet_wrap(~Cultivar)

plot10

######Question 8#######
# --- Violin-Boxplot Hybrid with Jittered Points ---

plot_violin_box <- ggplot(datum, aes(Treatment, DON, fill = Cultivar)) +   
  geom_violin(scale = "width", alpha = 0.7, trim = FALSE) +# Violin plot to show the distribution of data
  # scale = "width": Makes the violins the same maximum width across groups for better comparison
  # alpha = 0.7: Sets transparency 
  # trim = FALSE: Prevents the violin from cutting off at the minimum and maximum values
  geom_boxplot(width = 0.15,   # Makes the boxplot narrow to avoid overlapping the violin shape
               position = position_dodge(0.9),  # Ensures the boxplots are aligned within groups
               color = "black",   
               outlier.shape = NA) +  # Removes outlier points to prevent clutter
  scale_fill_manual(values = cbbPalette) +
  xlab("") + 
  ylab("DON (ppm)") +
  theme_minimal(base_size = 14) +  # Apply a minimal theme for a clean look
  theme(legend.position = "top") + #Move the legend to the top
  geom_point(position = position_jitterdodge(dodge.width = 0.9, jitter.width = 0.3), 
             shape = 21,       
             color = "black",  
             size = 1.5,       
             alpha = 0.6) +   
  ggtitle("Treatment Effects on DON Accumulation") + #Add a title to the plot
  theme(plot.title = element_text(hjust = 0.5, face = "bold"),  # Center-align and bold the title
        panel.grid.major.x = element_blank())  # Remove vertical grid lines for clarity

# Display the plot
plot_violin_box






