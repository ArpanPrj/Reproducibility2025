# Functions

Functions are things that do things to other objects in R.

## **How to write a function?**

\*\*Example: Convert Farhenheit to Celsius Formula: (5\*(degree_f-32)/9)
We will have to copy this every time and run it to convert farenheit to
celsius. The problem with this is we are copying and pasting and this
might introduce copy and paste errors. We can solve this by turning it
into a function.

``` r
F_to_C <- function(f_temp){ #f_temp is the input to this function
  celsius <- (5*(f_temp-32)/9)
  return(celsius) #return the celsius
}

F_to_C(32)
```

    ## [1] 0

``` r
F_to_C(-40)
```

    ## [1] -40

``` r
F_to_C(180)
```

    ## [1] 82.22222

\##Anatomy of function We are creating a function such that we wanna ask
what the farhenheit temperature is and we want a function in R to return
the celcius value. We named it F_to_C. We give f_temp to the function as
input, it uses it to calculate celsius and then returns the value of
celsius to the function

F_to_C \<- function(f_temp){ \#f_temp is the input to this function
celsius \<- (5\*(f_temp-32)/9) return(celsius) \#return the celsius }

## Trying out the opposite: Celsius to Farenheit

``` r
C_to_F <- function(c_temp){ #f_temp is the input to this function
  farenheit <- c_temp*(9/5)+32
  return(farenheit) #return the farenheit
}

C_to_F(-40)
```

    ## [1] -40

# Iterations

They are useful to prevent copy and paste errors.

## Base R iteration function

### rep function

``` r
rep("A",3)# Repeats A 3 times
```

    ## [1] "A" "A" "A"

``` r
rep(c("A","B"),10) # repeats A B ten times
```

    ##  [1] "A" "B" "A" "B" "A" "B" "A" "B" "A" "B" "A" "B" "A" "B" "A" "B" "A" "B" "A"
    ## [20] "B"

``` r
rep(c(1,2,5,3),4,each=5)# repeat 1 2 5 and 3 5 times and then repeat the whole sequence 4 times
```

    ##  [1] 1 1 1 1 1 2 2 2 2 2 5 5 5 5 5 3 3 3 3 3 1 1 1 1 1 2 2 2 2 2 5 5 5 5 5 3 3 3
    ## [39] 3 3 1 1 1 1 1 2 2 2 2 2 5 5 5 5 5 3 3 3 3 3 1 1 1 1 1 2 2 2 2 2 5 5 5 5 5 3
    ## [77] 3 3 3 3

### seq function

``` r
seq(from=1,to=7) 
```

    ## [1] 1 2 3 4 5 6 7

``` r
seq(from=0,to=10,by=2) # skips by 2 
```

    ## [1]  0  2  4  6  8 10

### seq_along function

Go position by position over a character vector and allows us to
reference them by numbers

``` r
LETTERS #Character vector for all alphabets
```

    ##  [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S"
    ## [20] "T" "U" "V" "W" "X" "Y" "Z"

``` r
seq_along(LETTERS) #Go position by position over  LETTER and allows us to reference them by numbers
```

    ##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
    ## [26] 26

## The for loop

Asks if the sequence is over, and until the answer is yes it keep on
running.

``` r
for (i in 1:10){
  print(i*2)
}# for each value of i that is 1 to 10, it prints the value times 2 until it reaches 10 
```

    ## [1] 2
    ## [1] 4
    ## [1] 6
    ## [1] 8
    ## [1] 10
    ## [1] 12
    ## [1] 14
    ## [1] 16
    ## [1] 18
    ## [1] 20

### Anatomy of for loop

Inside the parenthesis , we define our terms for iteration. Generalized
syntax is to use i. The sequence can be any number. Here, i is
1,2,3,4,5,6,7,8,9 and 10. Then we type whatever we want to do inside the
curly brackets. Here we are printing times two the value of each number
from 1 to 10. Each iteration is putting in one of the number until it
outputs every single result. The thing that loops over can be anything:
number, character vector, letters, whatever you need it to be.

### Combining functions and iterations

Lets do it for the above conversion functions.

``` r
for(i in -30:100){ # the sequence is -30 to 100
  result<-F_to_C(i) # Using the function we made
  print(result)
}
```

    ## [1] -34.44444
    ## [1] -33.88889
    ## [1] -33.33333
    ## [1] -32.77778
    ## [1] -32.22222
    ## [1] -31.66667
    ## [1] -31.11111
    ## [1] -30.55556
    ## [1] -30
    ## [1] -29.44444
    ## [1] -28.88889
    ## [1] -28.33333
    ## [1] -27.77778
    ## [1] -27.22222
    ## [1] -26.66667
    ## [1] -26.11111
    ## [1] -25.55556
    ## [1] -25
    ## [1] -24.44444
    ## [1] -23.88889
    ## [1] -23.33333
    ## [1] -22.77778
    ## [1] -22.22222
    ## [1] -21.66667
    ## [1] -21.11111
    ## [1] -20.55556
    ## [1] -20
    ## [1] -19.44444
    ## [1] -18.88889
    ## [1] -18.33333
    ## [1] -17.77778
    ## [1] -17.22222
    ## [1] -16.66667
    ## [1] -16.11111
    ## [1] -15.55556
    ## [1] -15
    ## [1] -14.44444
    ## [1] -13.88889
    ## [1] -13.33333
    ## [1] -12.77778
    ## [1] -12.22222
    ## [1] -11.66667
    ## [1] -11.11111
    ## [1] -10.55556
    ## [1] -10
    ## [1] -9.444444
    ## [1] -8.888889
    ## [1] -8.333333
    ## [1] -7.777778
    ## [1] -7.222222
    ## [1] -6.666667
    ## [1] -6.111111
    ## [1] -5.555556
    ## [1] -5
    ## [1] -4.444444
    ## [1] -3.888889
    ## [1] -3.333333
    ## [1] -2.777778
    ## [1] -2.222222
    ## [1] -1.666667
    ## [1] -1.111111
    ## [1] -0.5555556
    ## [1] 0
    ## [1] 0.5555556
    ## [1] 1.111111
    ## [1] 1.666667
    ## [1] 2.222222
    ## [1] 2.777778
    ## [1] 3.333333
    ## [1] 3.888889
    ## [1] 4.444444
    ## [1] 5
    ## [1] 5.555556
    ## [1] 6.111111
    ## [1] 6.666667
    ## [1] 7.222222
    ## [1] 7.777778
    ## [1] 8.333333
    ## [1] 8.888889
    ## [1] 9.444444
    ## [1] 10
    ## [1] 10.55556
    ## [1] 11.11111
    ## [1] 11.66667
    ## [1] 12.22222
    ## [1] 12.77778
    ## [1] 13.33333
    ## [1] 13.88889
    ## [1] 14.44444
    ## [1] 15
    ## [1] 15.55556
    ## [1] 16.11111
    ## [1] 16.66667
    ## [1] 17.22222
    ## [1] 17.77778
    ## [1] 18.33333
    ## [1] 18.88889
    ## [1] 19.44444
    ## [1] 20
    ## [1] 20.55556
    ## [1] 21.11111
    ## [1] 21.66667
    ## [1] 22.22222
    ## [1] 22.77778
    ## [1] 23.33333
    ## [1] 23.88889
    ## [1] 24.44444
    ## [1] 25
    ## [1] 25.55556
    ## [1] 26.11111
    ## [1] 26.66667
    ## [1] 27.22222
    ## [1] 27.77778
    ## [1] 28.33333
    ## [1] 28.88889
    ## [1] 29.44444
    ## [1] 30
    ## [1] 30.55556
    ## [1] 31.11111
    ## [1] 31.66667
    ## [1] 32.22222
    ## [1] 32.77778
    ## [1] 33.33333
    ## [1] 33.88889
    ## [1] 34.44444
    ## [1] 35
    ## [1] 35.55556
    ## [1] 36.11111
    ## [1] 36.66667
    ## [1] 37.22222
    ## [1] 37.77778

**But we dont have access to the values returned. They are not saved as
an object. So, how to do it in the loop?**

Step 1. Set a R object to NULL

Step 2. Set your for loop

Step 3. Save the result of your for loop into a dataframe each iteration

Step 4. append one row of the dataframe to the null object each
iteration of the loop.

``` r
celcius.df<- NULL # We wanna have this as variable in future but now it has nothing
for(i in -30:100){ # the sequence is -30 to 100
  result<-data.frame(F_to_C(i),i) # Making the data frame called results with 2 columns which contains results of each iteration of the function 
  celcius.df <- rbind.data.frame(celcius.df,result) # row binds the results which is a one row data frame each time to the celcius data frame iteration after iteration adding the rows to the same dataframe
}
celcius.df
```

    ##       F_to_C.i.   i
    ## 1   -34.4444444 -30
    ## 2   -33.8888889 -29
    ## 3   -33.3333333 -28
    ## 4   -32.7777778 -27
    ## 5   -32.2222222 -26
    ## 6   -31.6666667 -25
    ## 7   -31.1111111 -24
    ## 8   -30.5555556 -23
    ## 9   -30.0000000 -22
    ## 10  -29.4444444 -21
    ## 11  -28.8888889 -20
    ## 12  -28.3333333 -19
    ## 13  -27.7777778 -18
    ## 14  -27.2222222 -17
    ## 15  -26.6666667 -16
    ## 16  -26.1111111 -15
    ## 17  -25.5555556 -14
    ## 18  -25.0000000 -13
    ## 19  -24.4444444 -12
    ## 20  -23.8888889 -11
    ## 21  -23.3333333 -10
    ## 22  -22.7777778  -9
    ## 23  -22.2222222  -8
    ## 24  -21.6666667  -7
    ## 25  -21.1111111  -6
    ## 26  -20.5555556  -5
    ## 27  -20.0000000  -4
    ## 28  -19.4444444  -3
    ## 29  -18.8888889  -2
    ## 30  -18.3333333  -1
    ## 31  -17.7777778   0
    ## 32  -17.2222222   1
    ## 33  -16.6666667   2
    ## 34  -16.1111111   3
    ## 35  -15.5555556   4
    ## 36  -15.0000000   5
    ## 37  -14.4444444   6
    ## 38  -13.8888889   7
    ## 39  -13.3333333   8
    ## 40  -12.7777778   9
    ## 41  -12.2222222  10
    ## 42  -11.6666667  11
    ## 43  -11.1111111  12
    ## 44  -10.5555556  13
    ## 45  -10.0000000  14
    ## 46   -9.4444444  15
    ## 47   -8.8888889  16
    ## 48   -8.3333333  17
    ## 49   -7.7777778  18
    ## 50   -7.2222222  19
    ## 51   -6.6666667  20
    ## 52   -6.1111111  21
    ## 53   -5.5555556  22
    ## 54   -5.0000000  23
    ## 55   -4.4444444  24
    ## 56   -3.8888889  25
    ## 57   -3.3333333  26
    ## 58   -2.7777778  27
    ## 59   -2.2222222  28
    ## 60   -1.6666667  29
    ## 61   -1.1111111  30
    ## 62   -0.5555556  31
    ## 63    0.0000000  32
    ## 64    0.5555556  33
    ## 65    1.1111111  34
    ## 66    1.6666667  35
    ## 67    2.2222222  36
    ## 68    2.7777778  37
    ## 69    3.3333333  38
    ## 70    3.8888889  39
    ## 71    4.4444444  40
    ## 72    5.0000000  41
    ## 73    5.5555556  42
    ## 74    6.1111111  43
    ## 75    6.6666667  44
    ## 76    7.2222222  45
    ## 77    7.7777778  46
    ## 78    8.3333333  47
    ## 79    8.8888889  48
    ## 80    9.4444444  49
    ## 81   10.0000000  50
    ## 82   10.5555556  51
    ## 83   11.1111111  52
    ## 84   11.6666667  53
    ## 85   12.2222222  54
    ## 86   12.7777778  55
    ## 87   13.3333333  56
    ## 88   13.8888889  57
    ## 89   14.4444444  58
    ## 90   15.0000000  59
    ## 91   15.5555556  60
    ## 92   16.1111111  61
    ## 93   16.6666667  62
    ## 94   17.2222222  63
    ## 95   17.7777778  64
    ## 96   18.3333333  65
    ## 97   18.8888889  66
    ## 98   19.4444444  67
    ## 99   20.0000000  68
    ## 100  20.5555556  69
    ## 101  21.1111111  70
    ## 102  21.6666667  71
    ## 103  22.2222222  72
    ## 104  22.7777778  73
    ## 105  23.3333333  74
    ## 106  23.8888889  75
    ## 107  24.4444444  76
    ## 108  25.0000000  77
    ## 109  25.5555556  78
    ## 110  26.1111111  79
    ## 111  26.6666667  80
    ## 112  27.2222222  81
    ## 113  27.7777778  82
    ## 114  28.3333333  83
    ## 115  28.8888889  84
    ## 116  29.4444444  85
    ## 117  30.0000000  86
    ## 118  30.5555556  87
    ## 119  31.1111111  88
    ## 120  31.6666667  89
    ## 121  32.2222222  90
    ## 122  32.7777778  91
    ## 123  33.3333333  92
    ## 124  33.8888889  93
    ## 125  34.4444444  94
    ## 126  35.0000000  95
    ## 127  35.5555556  96
    ## 128  36.1111111  97
    ## 129  36.6666667  98
    ## 130  37.2222222  99
    ## 131  37.7777778 100

## A more practical and challengig example

lets see a more complicated example where we subset a dataset based on
isolate within our fungicide sensitivity dataset and we perform a
function on it and extract some results.

For this example we will use the package ‘drc’ and the dataset
EC50.all.csv

``` r
# read in the data
EC50.data <- read.csv("Iterations_Functions/EC50_all.csv")
```

Within this dataset is a list of isolates and fungicide sensitivity
data.

We want to find something called an EC50 or the concentration of a
fungicide that reduces growth by 50% relative to the non-amended
control.

It is a S shaped curve and uses non linear regression.

We do this using non-linear modeling with the DRC package with a model
called the LL.4 The specifics of the model are not that important. What
is important is that in order to use this model we have to model each
isolate individually and gather the EC50 data.

``` r
library(drc)
```

    ## Warning: package 'drc' was built under R version 4.4.3

    ## Loading required package: MASS

    ## 
    ## 'drc' has been loaded.

    ## Please cite R and 'drc' if used for a publication,

    ## for references type 'citation()' and 'citation('drc')'.

    ## 
    ## Attaching package: 'drc'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     gaussian, getInitial

``` r
library(tidyverse)
```

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ## ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.4     ✔ tidyr     1.3.1
    ## ✔ purrr     1.0.4

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ✖ dplyr::select() masks MASS::select()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

An example is shown here where we do this on isolate ILSO_5-41c

``` r
isolate1 <- drm(100 * EC50.data$relgrowth[EC50.data$is == "ILSO_5-41c"] ~ #Subsetting the data for the isolate
        EC50.data$conc[EC50.data$is == "ILSO_5-41c"], 
                       fct = LL.4(fixed = c(NA, NA, NA, NA), 
                                  names = c("Slope", "Lower", "Upper", "EC50")), 
                       na.action = na.omit)
    # outputs the summary of the paramters including the estimate, standard
    # error, t-value, and p-value outputs it into a data frame called
    # summary.mef.fit for 'summary of fit'
    summary.fit <- data.frame(summary(isolate1)[[3]])
    # outputs the summary of just the EC50 data including the estimate, standard
    # error, upper and lower bounds of the 95% confidence intervals around the
    # EC50
    EC50 <- ED(isolate1, respLev = c(50), type = "relative", 
        interval = "delta")[[1]]
```

    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1070318  0.0055365 0.0957543 0.1183094

``` r
    EC50
```

    ## [1] 0.1070318

It would not be reproducible to do copy and paste each isolate into the
code above to run the model for every isolate. It would also not be very
reproducible to copy and paste the code below since this is prone to
errors.

There are then two options: *a loop that iterates over isolate names *a
newer way using the function map()

**First the loop**

First we need to create a vector to loop over containing the names of
our isolates. We will call this ‘nm’ using the function ‘unique’.

``` r
nm <- unique(EC50.data$is) ## setting the character vector we want to use. The unique function finds the unique value 
nm
```

    ##  [1] "ILSO_5-41c"      "ILSO_5-42c"      "ILSO_5-49b"      "ILSO_6-1"       
    ##  [5] "ILSO_6-12B"      "ILSO_6-2b"       "ILSO_6-33C"      "ILSO_6-39C"     
    ##  [9] "ILSO_6-15b"      "ILSO_6-28C"      "ILSO_6-34c"      "ILSO_6-35b"     
    ## [13] "ILSO_6-36b"      "INSO_1-13D"      "INSO_1-17C"      "INSO_1-17D"     
    ## [17] "INSO_1-23-C"     "INSO_1-28-C"     "INSO_1-28-D"     "INSO_1-52-B"    
    ## [21] "INSO_1-53A"      "INSO_2-57"       "INSO_3-45"       "INSO_3-49"      
    ## [25] "IASO_1-16.1h"    "IASO_1-16.2r"    "IASO_1-20.44rt"  "IASO_10-28.24rt"
    ## [29] "IASO_2-11.8"     "IASO_6-10.15h"   "IASO_6-34.31r"   "IASO_9-10.4h"   
    ## [33] "IASO_9-11.1h"    "IASO_9-24.27rd"  "IASO_9-29.33h"   "IASO_9-31.37h"  
    ## [37] "IASO_9-36.42rd"  "IASO_9-4.8h"     "KSSO_3-34"       "KSSO_5-21"      
    ## [41] "C-MISO2_1-19"    "MISO_5-9"        "MISO_8-23"       "C-MNSO_6-4"     
    ## [45] "C-MNSO2_1-1"     "C-MNSO2_1-19"    "C-MNSO2_2-10"    "MNSO_2-11"      
    ## [49] "MNSO_2-31"       "MNSO_2-52"       "MNSO_5-20"       "NESO_1-27"      
    ## [53] "NESO_3-20"       "NESO_4-20"       "NESO_4-38"       "NESO_4-40"      
    ## [57] "NESO_4-42"       "NESO_4-47"       "NDSO_4-1"        "NDSO_4-18"      
    ## [61] "NDSO_4-2"        "NDSO_4-43"       "NDSO_4-45"       "NDSO_5-22"      
    ## [65] "NDSO_5-36"       "NDSO_5-46"       "NDSO_5-49"       "NDSO_5-9"       
    ## [69] "C-SDSO2_5-16"    "C-SDSO2_5-17"    "C-SDSO2_5-29"    "C-SDSO2_5-8"    
    ## [73] "C-SDSO2_5-9"     "C-SDSO2_6-33"    "V-SDSO2_5-41"

Then we can write a loop using the code above and input our list of
isolates, ‘nm’ by using ‘seq_along’

Then when ever we want to input our isolate name we will put
nm\[\[i\]\].

So, as the loop goes along the list of isolate names it will input the
name of the isolate, calculate EC50 and run the model and output EC50.

``` r
for (i in seq_along(nm)) { # the seq_along is helpful to loop over the nm vector
  isolate1 <- drm(100 * EC50.data$relgrowth[EC50.data$is == nm[[i]]] ~ 
        EC50.data$conc[EC50.data$is == nm[[i]]], 
                       fct = LL.4(fixed = c(NA, NA, NA, NA), 
                                  names = c("Slope", "Lower", "Upper", "EC50")), 
                       na.action = na.omit)
  print(nm[[i]])
    # outputs the summary of the paramters including the estimate, standard
    # error, t-value, and p-value outputs it into a data frame called
    # summary.mef.fit for 'summary of fit'
    summary.fit <- data.frame(summary(isolate1)[[3]])
    # outputs the summary of just the EC50 data including the estimate, standard
    # error, upper and lower bounds of the 95% confidence intervals around the
    # EC50
    EC50 <- ED(isolate1, respLev = c(50), type = "relative", 
        interval = "delta")[[1]]
    EC50
}
```

    ## [1] "ILSO_5-41c"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1070318  0.0055365 0.0957543 0.1183094
    ## [1] "ILSO_5-42c"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.248655   0.028485 0.190633 0.306678
    ## [1] "ILSO_5-49b"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.167592   0.010197 0.146821 0.188362
    ## [1] "ILSO_6-1"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1082677  0.0051459 0.0977858 0.1187495
    ## [1] "ILSO_6-12B"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.184271   0.036047 0.110846 0.257695
    ## [1] "ILSO_6-2b"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.227432   0.040614 0.144704 0.310160
    ## [1] "ILSO_6-33C"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.101863   0.003487 0.094760 0.108965
    ## [1] "ILSO_6-39C"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1102721  0.0033354 0.1034780 0.1170661
    ## [1] "ILSO_6-15b"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.123288   0.014018 0.094735 0.151841
    ## [1] "ILSO_6-28C"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0998727  0.0044787 0.0907498 0.1089956
    ## [1] "ILSO_6-34c"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.69465    0.39164 -0.10310  1.49240
    ## [1] "ILSO_6-35b"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.113975   0.012773 0.087958 0.139993
    ## [1] "ILSO_6-36b"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.217436   0.027934 0.160536 0.274335
    ## [1] "INSO_1-13D"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1432333  0.0093132 0.1242629 0.1622036
    ## [1] "INSO_1-17C"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.18336    0.01293 0.15695 0.20977
    ## [1] "INSO_1-17D"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.186929   0.034023 0.117626 0.256232
    ## [1] "INSO_1-23-C"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0299288  0.0017812 0.0263007 0.0335569
    ## [1] "INSO_1-28-C"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.200379   0.020104 0.159429 0.241329
    ## [1] "INSO_1-28-D"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.30812    0.24033 -0.18142  0.79765
    ## [1] "INSO_1-52-B"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.227103   0.019697 0.186983 0.267224
    ## [1] "INSO_1-53A"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.20009    0.01448 0.17059 0.22958
    ## [1] "INSO_2-57"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.223966   0.058089 0.105642 0.342290
    ## [1] "INSO_3-45"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.288001   0.074597 0.136052 0.439951
    ## [1] "INSO_3-49"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.369422   0.077015 0.212549 0.526296
    ## [1] "IASO_1-16.1h"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.118335   0.011733 0.094404 0.142265
    ## [1] "IASO_1-16.2r"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.189945   0.013146 0.163097 0.216793
    ## [1] "IASO_1-20.44rt"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0483296  0.0022658 0.0437143 0.0529448
    ## [1] "IASO_10-28.24rt"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.190146   0.027182 0.134779 0.245514
    ## [1] "IASO_2-11.8"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.16580    0.01082 0.14376 0.18784
    ## [1] "IASO_6-10.15h"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.183297   0.017237 0.148187 0.218407
    ## [1] "IASO_6-34.31r"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.130147   0.010705 0.108342 0.151951
    ## [1] "IASO_9-10.4h"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1915200  0.0077369 0.1757605 0.2072795
    ## [1] "IASO_9-11.1h"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.123034   0.006696 0.109395 0.136673
    ## [1] "IASO_9-24.27rd"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1935594  0.0094277 0.1743559 0.2127629
    ## [1] "IASO_9-29.33h"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.198000   0.019219 0.158853 0.237148
    ## [1] "IASO_9-31.37h"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1114482  0.0070542 0.0970793 0.1258172
    ## [1] "IASO_9-36.42rd"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.159440   0.010423 0.138209 0.180671
    ## [1] "IASO_9-4.8h"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1372654  0.0070847 0.1228343 0.1516965
    ## [1] "KSSO_3-34"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50  0.427766   0.230327 -0.041395  0.896927
    ## [1] "KSSO_5-21"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0991738  0.0040323 0.0909603 0.1073874
    ## [1] "C-MISO2_1-19"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.106855   0.022010 0.062022 0.151687
    ## [1] "MISO_5-9"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.156127   0.021551 0.112229 0.200025
    ## [1] "MISO_8-23"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.308127   0.019233 0.268951 0.347304
    ## [1] "C-MNSO_6-4"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.117014   0.012255 0.092052 0.141977
    ## [1] "C-MNSO2_1-1"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.177036   0.011915 0.152767 0.201305
    ## [1] "C-MNSO2_1-19"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.234268   0.017095 0.199447 0.269088
    ## [1] "C-MNSO2_2-10"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0172659  0.0012838 0.0146508 0.0198809
    ## [1] "MNSO_2-11"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.201737   0.012113 0.176998 0.226476
    ## [1] "MNSO_2-31"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.306968   0.078617 0.146831 0.467105
    ## [1] "MNSO_2-52"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.289597   0.081347 0.123464 0.455730
    ## [1] "MNSO_5-20"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.213191   0.024013 0.164278 0.262104
    ## [1] "NESO_1-27"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.42728    0.28840 -0.16016  1.01472
    ## [1] "NESO_3-20"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0900834  0.0021351 0.0857344 0.0944324
    ## [1] "NESO_4-20"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1573077  0.0065037 0.1440602 0.1705553
    ## [1] "NESO_4-38"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.16319    0.01761 0.12732 0.19906
    ## [1] "NESO_4-40"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.20914    0.01403 0.18056 0.23772
    ## [1] "NESO_4-42"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.17905    0.00849 0.16171 0.19639
    ## [1] "NESO_4-47"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1587569  0.0098007 0.1387411 0.1787727
    ## [1] "NDSO_4-1"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1352667  0.0074545 0.1200824 0.1504511
    ## [1] "NDSO_4-18"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.247784   0.036714 0.173000 0.322567
    ## [1] "NDSO_4-2"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.235268   0.026532 0.181223 0.289313
    ## [1] "NDSO_4-43"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.066926   0.010213 0.046123 0.087728
    ## [1] "NDSO_4-45"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.174492   0.010501 0.153102 0.195882
    ## [1] "NDSO_5-22"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.181951   0.028336 0.124233 0.239669
    ## [1] "NDSO_5-36"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.195576   0.013476 0.168125 0.223027
    ## [1] "NDSO_5-46"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.168410   0.010795 0.146421 0.190399
    ## [1] "NDSO_5-49"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1546980  0.0093702 0.1354373 0.1739588
    ## [1] "NDSO_5-9"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.162666   0.011066 0.140126 0.185206
    ## [1] "C-SDSO2_5-16"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.147113   0.008233 0.130343 0.163883
    ## [1] "C-SDSO2_5-17"
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1376907  0.0077899 0.1218232 0.1535582
    ## [1] "C-SDSO2_5-29"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.118886   0.004502 0.109716 0.128057
    ## [1] "C-SDSO2_5-8"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.206342   0.016866 0.171988 0.240696
    ## [1] "C-SDSO2_5-9"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.175509   0.013954 0.147086 0.203932
    ## [1] "C-SDSO2_6-33"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.65376    0.63282 -0.63525  1.94277
    ## [1] "V-SDSO2_5-41"
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.211026   0.012571 0.185419 0.236633

\*\* Then Binding the results of each iterations\*\*

But this is still not super helpful because the output is not saved and
we cant use it in a plot or something. So, we now need to save the
output of a loop into a dataframe.

The way we do this is to create the dataframe row by row in the loop.

To do this we first need to create a null dataframe and add to it each
iteration.

``` r
EC50.ll4 <- NULL # create a null object 
for (i in seq_along(nm)) {
  isolate1 <- drm(100 * EC50.data$relgrowth[EC50.data$is == nm[[i]]] ~ 
        EC50.data$conc[EC50.data$is == nm[[i]]], 
                       fct = LL.4(fixed = c(NA, NA, NA, NA), 
                                  names = c("Slope", "Lower", "Upper", "EC50")), 
                       na.action = na.omit)
    # outputs the summary of the paramters including the estimate, standard
    # error, t-value, and p-value outputs it into a data frame called
    # summary.mef.fit for 'summary of fit'
    summary.fit <- data.frame(summary(isolate1)[[3]])
    # outputs the summary of just the EC50 data including the estimate, standard
    # error, upper and lower bounds of the 95% confidence intervals around the
    # EC50
    EC50 <- ED(isolate1, respLev = c(50), type = "relative", 
        interval = "delta")[[1]]
    EC50
    isolate.ec_i <- data.frame(nm[[i]], EC50) # create a one row dataframe containing just the isolate name and the EC50
    colnames(isolate.ec_i) <- c("Isolate", "EC50") # change the column names
    
    # Then we need to append our one row dataframe to our null dataframe we created before
    # and save it as EC50.ll4. 
    EC50.ll4 <- rbind.data.frame(EC50.ll4, isolate.ec_i)
}
```

    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1070318  0.0055365 0.0957543 0.1183094
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.248655   0.028485 0.190633 0.306678
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.167592   0.010197 0.146821 0.188362
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1082677  0.0051459 0.0977858 0.1187495
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.184271   0.036047 0.110846 0.257695
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.227432   0.040614 0.144704 0.310160
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.101863   0.003487 0.094760 0.108965
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1102721  0.0033354 0.1034780 0.1170661
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.123288   0.014018 0.094735 0.151841
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0998727  0.0044787 0.0907498 0.1089956
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.69465    0.39164 -0.10310  1.49240
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.113975   0.012773 0.087958 0.139993
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.217436   0.027934 0.160536 0.274335
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1432333  0.0093132 0.1242629 0.1622036
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.18336    0.01293 0.15695 0.20977
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.186929   0.034023 0.117626 0.256232
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0299288  0.0017812 0.0263007 0.0335569
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.200379   0.020104 0.159429 0.241329
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.30812    0.24033 -0.18142  0.79765
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.227103   0.019697 0.186983 0.267224
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.20009    0.01448 0.17059 0.22958
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.223966   0.058089 0.105642 0.342290
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.288001   0.074597 0.136052 0.439951
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.369422   0.077015 0.212549 0.526296
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.118335   0.011733 0.094404 0.142265
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.189945   0.013146 0.163097 0.216793
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0483296  0.0022658 0.0437143 0.0529448
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.190146   0.027182 0.134779 0.245514
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.16580    0.01082 0.14376 0.18784
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.183297   0.017237 0.148187 0.218407
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.130147   0.010705 0.108342 0.151951
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1915200  0.0077369 0.1757605 0.2072795
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.123034   0.006696 0.109395 0.136673
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1935594  0.0094277 0.1743559 0.2127629
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.198000   0.019219 0.158853 0.237148
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1114482  0.0070542 0.0970793 0.1258172
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.159440   0.010423 0.138209 0.180671
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1372654  0.0070847 0.1228343 0.1516965
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50  0.427766   0.230327 -0.041395  0.896927
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0991738  0.0040323 0.0909603 0.1073874
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.106855   0.022010 0.062022 0.151687
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.156127   0.021551 0.112229 0.200025
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.308127   0.019233 0.268951 0.347304
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.117014   0.012255 0.092052 0.141977
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.177036   0.011915 0.152767 0.201305
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.234268   0.017095 0.199447 0.269088
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0172659  0.0012838 0.0146508 0.0198809
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.201737   0.012113 0.176998 0.226476
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.306968   0.078617 0.146831 0.467105
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.289597   0.081347 0.123464 0.455730
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.213191   0.024013 0.164278 0.262104
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.42728    0.28840 -0.16016  1.01472
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0900834  0.0021351 0.0857344 0.0944324
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1573077  0.0065037 0.1440602 0.1705553
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.16319    0.01761 0.12732 0.19906
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.20914    0.01403 0.18056 0.23772
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.17905    0.00849 0.16171 0.19639
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1587569  0.0098007 0.1387411 0.1787727
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1352667  0.0074545 0.1200824 0.1504511
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.247784   0.036714 0.173000 0.322567
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.235268   0.026532 0.181223 0.289313
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.066926   0.010213 0.046123 0.087728
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.174492   0.010501 0.153102 0.195882
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.181951   0.028336 0.124233 0.239669
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.195576   0.013476 0.168125 0.223027
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.168410   0.010795 0.146421 0.190399
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1546980  0.0093702 0.1354373 0.1739588
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.162666   0.011066 0.140126 0.185206
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.147113   0.008233 0.130343 0.163883
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1376907  0.0077899 0.1218232 0.1535582
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.118886   0.004502 0.109716 0.128057
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.206342   0.016866 0.171988 0.240696
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.175509   0.013954 0.147086 0.203932
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.65376    0.63282 -0.63525  1.94277
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.211026   0.012571 0.185419 0.236633

**Using the map() function** However, just like everything else in R,
there are multiple ways to do the same thing.

Lets demonstrate this example with the function map() and nested
dataframes within the tidyr package.

The concept is that loops are combersome and hard to read. So, the map()
function was created and everything is contained within the same R
object.

Here is the example of how to do this:

``` r
EC50.data %>%
  group_by(is) %>% # group by isolate column
  nest() %>% # allows us to make a sub dataframe within a dataframe
  mutate(ll.4.mod = map(data, ~drm(.$relgrowth ~ .$conc,#loop over data per isolate # To do that, Create a new column ll.4.mod that is summary data of each non linear regression. The map function tells us that we want to iterate, Its  a for loop within a function. LL.4.mod is equal to the summary output of drm function ,and we want to do it over the data. The period symbol inherits all the columns (concentration and relgrowth here) from the data
                              fct = LL.4(fixed = c(NA, NA, NA, NA), 
                                         names = c("Slope", "Lower", "Upper", "EC50"))))) %>%
  mutate(ec50 = map(ll.4.mod, ~ED(., 
                              respLev = c(50), 
                              type = "relative",
                              interval = "delta")[[1]])) %>% # We want to then map or iterate over our ll4 model to scrub the EC50 value, mapping the ED fuction is what it is doing
  unnest(ec50)
```

    ## Warning: There were 19 warnings in `mutate()`.
    ## The first warning was:
    ## ℹ In argument: `ll.4.mod = map(...)`.
    ## ℹ In group 4: `is = "C-MNSO2_2-10"`.
    ## Caused by warning in `log()`:
    ## ! NaNs produced
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 18 remaining warnings.

    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.106855   0.022010 0.062022 0.151687
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.177036   0.011915 0.152767 0.201305
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.234268   0.017095 0.199447 0.269088
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0172659  0.0012838 0.0146508 0.0198809
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.117014   0.012255 0.092052 0.141977
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.147113   0.008233 0.130343 0.163883
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1376907  0.0077899 0.1218232 0.1535582
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.118886   0.004502 0.109716 0.128057
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.206342   0.016866 0.171988 0.240696
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.175509   0.013954 0.147086 0.203932
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.65376    0.63282 -0.63525  1.94277
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.118335   0.011733 0.094404 0.142265
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.189945   0.013146 0.163097 0.216793
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0483296  0.0022658 0.0437143 0.0529448
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.190146   0.027182 0.134779 0.245514
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.16580    0.01082 0.14376 0.18784
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.183297   0.017237 0.148187 0.218407
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.130147   0.010705 0.108342 0.151951
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1915200  0.0077369 0.1757605 0.2072795
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.123034   0.006696 0.109395 0.136673
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1935594  0.0094277 0.1743559 0.2127629
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.198000   0.019219 0.158853 0.237148
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1114482  0.0070542 0.0970793 0.1258172
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.159440   0.010423 0.138209 0.180671
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1372654  0.0070847 0.1228343 0.1516965
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1070318  0.0055365 0.0957543 0.1183094
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.248655   0.028485 0.190633 0.306678
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.167592   0.010197 0.146821 0.188362
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1082677  0.0051459 0.0977858 0.1187495
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.184271   0.036047 0.110846 0.257695
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.123288   0.014018 0.094735 0.151841
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0998727  0.0044787 0.0907498 0.1089956
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.227432   0.040614 0.144704 0.310160
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.101863   0.003487 0.094760 0.108965
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.69465    0.39164 -0.10310  1.49240
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.113975   0.012773 0.087958 0.139993
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.217436   0.027934 0.160536 0.274335
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1102721  0.0033354 0.1034780 0.1170661
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1432333  0.0093132 0.1242629 0.1622036
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.18336    0.01293 0.15695 0.20977
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.186929   0.034023 0.117626 0.256232
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0299288  0.0017812 0.0263007 0.0335569
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.200379   0.020104 0.159429 0.241329
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.30812    0.24033 -0.18142  0.79765
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.227103   0.019697 0.186983 0.267224
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.20009    0.01448 0.17059 0.22958
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.223966   0.058089 0.105642 0.342290
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.288001   0.074597 0.136052 0.439951
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.369422   0.077015 0.212549 0.526296
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50  0.427766   0.230327 -0.041395  0.896927
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0991738  0.0040323 0.0909603 0.1073874
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.156127   0.021551 0.112229 0.200025
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.308127   0.019233 0.268951 0.347304
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.201737   0.012113 0.176998 0.226476
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.306968   0.078617 0.146831 0.467105
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.289597   0.081347 0.123464 0.455730
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.213191   0.024013 0.164278 0.262104
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1352667  0.0074545 0.1200824 0.1504511
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.247784   0.036714 0.173000 0.322567
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.235268   0.026532 0.181223 0.289313
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.066926   0.010213 0.046123 0.087728
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.174492   0.010501 0.153102 0.195882
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.181951   0.028336 0.124233 0.239669
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.195576   0.013476 0.168125 0.223027
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.168410   0.010795 0.146421 0.190399
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1546980  0.0093702 0.1354373 0.1739588
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.162666   0.011066 0.140126 0.185206
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.42728    0.28840 -0.16017  1.01472
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0900834  0.0021351 0.0857344 0.0944324
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1573077  0.0065037 0.1440602 0.1705553
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.16319    0.01761 0.12732 0.19906
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.20914    0.01403 0.18056 0.23772
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.17905    0.00849 0.16171 0.19639
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1587569  0.0098007 0.1387411 0.1787727
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.211026   0.012571 0.185419 0.236633

    ## # A tibble: 75 × 4
    ## # Groups:   is [75]
    ##    is         data               ll.4.mod   ec50
    ##    <chr>      <list>             <list>    <dbl>
    ##  1 ILSO_5-41c <tibble [36 × 11]> <drc>    0.107 
    ##  2 ILSO_5-42c <tibble [36 × 11]> <drc>    0.249 
    ##  3 ILSO_5-49b <tibble [36 × 11]> <drc>    0.168 
    ##  4 ILSO_6-1   <tibble [36 × 11]> <drc>    0.108 
    ##  5 ILSO_6-12B <tibble [36 × 11]> <drc>    0.184 
    ##  6 ILSO_6-2b  <tibble [36 × 11]> <drc>    0.227 
    ##  7 ILSO_6-33C <tibble [36 × 11]> <drc>    0.102 
    ##  8 ILSO_6-39C <tibble [36 × 11]> <drc>    0.110 
    ##  9 ILSO_6-15b <tibble [36 × 11]> <drc>    0.123 
    ## 10 ILSO_6-28C <tibble [36 × 11]> <drc>    0.0999
    ## # ℹ 65 more rows
