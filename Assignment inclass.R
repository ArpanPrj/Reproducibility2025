z <- c(1:200) # Creates a vector z and stores values from 1 to 200 in it.
z
mean(z) # mean of z
sd(z) # Sd of z

zlog <- z > 30 #Create a logical vector named zlog that is 'TRUE' for z values greater than 30 and 'FALSE' otherwise

zdf <- data.frame(z, zlog)#Change the column names in your new dataframe to equal “zvec” and “zlogic”


colnames(zdf) <- c("zvec", "zlogic")# Change column names to "zvec" and "zlogic"


zdf$zsquared <- zdf$zvec^2# Add a new column 'zsquared' which is zvec squared


subset_zdf1 <- subset(zdf, zsquared > 10 & zsquared < 100) # Subset the dataframe to include only values where zsquared is >10 and <100 (using subset function)


subset_zdf2 <- zdf[zdf$zsquared > 10 & zdf$zsquared < 100, ] # Subset the dataframe using logical indexing


row_26 <- zdf[26, ]# Subset the zdf dataframe to only include row 26

zsquared_180 <- zdf$zsquared[180] #Subset the zdf dataframe to get only the zsquared value in the 180th row
# we can also do this: zsquared_180<-zdf[180,3] as the zsquared is in the third column

# Print all subsets
print(subset_zdf1)
print(subset_zdf2)
print(row_26)
print(zsquared_180)

tips_data <- read.csv("TipsR.csv", na.strings = ".") ## Read the CSV file and treat "." as NA

# To know if the data was correctly uploaded
summary(tips_data) 
str(tips_data)
