``` r
z <- c(1:200) # Creates a vector z and stores values from 1 to 200 in it.
z
```

    ##   [1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18
    ##  [19]  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35  36
    ##  [37]  37  38  39  40  41  42  43  44  45  46  47  48  49  50  51  52  53  54
    ##  [55]  55  56  57  58  59  60  61  62  63  64  65  66  67  68  69  70  71  72
    ##  [73]  73  74  75  76  77  78  79  80  81  82  83  84  85  86  87  88  89  90
    ##  [91]  91  92  93  94  95  96  97  98  99 100 101 102 103 104 105 106 107 108
    ## [109] 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126
    ## [127] 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144
    ## [145] 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162
    ## [163] 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180
    ## [181] 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198
    ## [199] 199 200

``` r
mean(z) # mean of z
```

    ## [1] 100.5

``` r
sd(z) # Sd of z
```

    ## [1] 57.87918

``` r
zlog <- z > 30 #Create a logical vector named zlog that is 'TRUE' for z values greater than 30 and 'FALSE' otherwise

zdf <- data.frame(z, zlog)#Change the column names in your new dataframe to equal “zvec” and “zlogic”


colnames(zdf) <- c("zvec", "zlogic")# Change column names to "zvec" and "zlogic"


zdf$zsquared <- zdf$zvec^2# Add a new column 'zsquared' which is zvec squared


subset_zdf1 <- subset(zdf$zsquared, zdf$zsquared > 10 & zdf$zsquared < 100) # Subset the dataframe to include only values where zsquared is >10 and <100 (using subset function)


subset_zdf2 <- zdf$zsquared[zdf$zsquared > 10 & zdf$zsquared < 100] # Subset the dataframe using logical indexing


row_26 <- zdf[26,]# Subset the zdf dataframe to only include row 26 values

zsquared_180 <- zdf$zsquared[180] #Subset the zdf dataframe to get only the zsquared value in the 180th row
# we can also do this: zsquared_180<-zdf[180,3] as the zsquared is in the third column

# Print all subsets
print(subset_zdf1)
```

    ## [1] 16 25 36 49 64 81

``` r
print(subset_zdf2)
```

    ## [1] 16 25 36 49 64 81

``` r
print(row_26)
```

    ##    zvec zlogic zsquared
    ## 26   26  FALSE      676

``` r
print(zsquared_180)
```

    ## [1] 32400

``` r
tips_data <- read.csv("https://raw.githubusercontent.com/ArpanPrj/Reproducibility2025/refs/heads/main/Basics_to_R/TipsR.csv", na.strings = ".") ## Read the CSV file and treat "." as NA
```
