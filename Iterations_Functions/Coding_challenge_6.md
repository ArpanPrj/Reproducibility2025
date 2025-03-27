# Question 1

**Regarding reproducibility, what is the main point of writing your own
functions and iterations?**

# Question 2

**In your own words, describe how to write a function and a for loop in
R and how they work. Give me specifics like syntax, where to write code,
and how the results are returned.**

# Question 3

**This dataset contains the population and coordinates (latitude and
longitude) of the 40 most populous cities in the US, along with Auburn,
AL. Your task is to create a function that calculates the distance
between Auburn and each other city using the Haversine formula. To do
this, you’ll write a for loop that goes through each city in the dataset
and computes the distance from Auburn. Detailed steps are provided
below.**

**Read in the Cities.csv file from Canvas using a relative file path.**

``` r
citydata<-read.csv("Iterations_Functions/Cities.csv",na.strings="na")
```

# Question 4

**Write a function to calculate the distance between two pairs of
coordinates based on the Haversine formula (see below). The input into
the function should be lat1, lon1, lat2, and lon2. The function should
return the object distance_km. All the code below needs to go into the
function.**

``` r
dist<- function(lat1, lon1, lat2, lon2) {
  # convert to radians
  rad.lat1 <- lat1 * pi / 180
  rad.lon1 <- lon1 * pi / 180
  rad.lat2 <- lat2 * pi / 180
  rad.lon2 <- lon2 * pi / 180

  # Haversine formula
  delta_lat <- rad.lat2 - rad.lat1
  delta_lon <- rad.lon2 - rad.lon1
  a <- sin(delta_lat / 2)^2 + cos(rad.lat1) * cos(rad.lat2) * sin(delta_lon / 2)^2
  c <- 2 * asin(sqrt(a)) 

  # Earth's radius in meters
  earth_radius <- 6378137

  # Calculate the distance in kilometers
  distance_km <- (earth_radius * c) / 1000

  return(distance_km)
}
```

# Question 5

**Using your function, compute the distance between Auburn, AL and New
York City ** **a. Subset/filter the Cities.csv data to include only the
latitude and longitude values you need and input as input to your
function.** **b. The output of your function should be 1367.854 km**

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
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
distance <- citydata %>%
  filter(city %in% c("Auburn", "New York")) %>%
  summarise(distance_km = dist(
    lat[city == "Auburn"],
    long[city == "Auburn"],
    lat[city == "New York"],
    long[city == "New York"]
  ))
```

# Question 6

**Now, use your function within a for loop to calculate the distance
between all other cities in the data. The output of the first 9
iterations is shown below.**

``` r
library(tidyverse)

for (i in seq_along(citydata$city)) { # Here I used seq_along to loop from 1st to 40th city, i use tis for 1st city latitide and longitude
  if (i < length(citydata$city)) { # But when I used i as it is i.e 1 to 10, the j would be 41 when i is 40. This was returning me  extra combinations of city, 40th city and 41st city (which was NA). So to remove these combinations, I had to use if command to loop till i was 39 because when i is 39, j is 40 in the code below. So the 40th city is already included in the combination. This way I also avoid getting 41 in j that returns NA and increases the number of combination
    for (j in seq((i + 1), length(citydata$city))) { # this is to loop for 2nd city latitude and longitude. It is set such that when i is 1, j is 2, and so on till i reaches 39 and j reaches 40. then the loop stops
      lat1 <- citydata$lat[i]
      lon1 <- citydata$long[i]
      lat2 <- citydata$lat[j]
      lon2 <- citydata$long[j]

      distance_km <- dist(lat1, lon1, lat2, lon2) # using the dist function I created to calculate distance
      print(distance_km)
    }
  }
}
```

    ## [1] 3958.048
    ## [1] 1157.245
    ## [1] 1758.655
    ## [1] 2288.873
    ## [1] 2210.803
    ## [1] 127.9107
    ## [1] 1207.181
    ## [1] 331.0092
    ## [1] 297.8703
    ## [1] 3449.902
    ## [1] 787.0379
    ## [1] 3876.098
    ## [1] 4143.669
    ## [1] 3909.567
    ## [1] 1644.531
    ## [1] 1614.14
    ## [1] 5.344023
    ## [1] 2618.935
    ## [1] 12.39019
    ## [1] 3880.792
    ## [1] 3603.939
    ## [1] 276.5944
    ## [1] 1415.029
    ## [1] 3934.522
    ## [1] 2553.273
    ## [1] 4032.968
    ## [1] 2438.589
    ## [1] 1518.734
    ## [1] 2593.334
    ## [1] 4111.827
    ## [1] 1042.692
    ## [1] 512.4094
    ## [1] 919.1842
    ## [1] 10.5125
    ## [1] 1766.069
    ## [1] 656.3027
    ## [1] 772.4659
    ## [1] 18.03575
    ## [1] 1367.854
    ## [1] 2812.1
    ## [1] 3775.771
    ## [1] 2221.812
    ## [1] 2011.485
    ## [1] 3861.195
    ## [1] 3124.219
    ## [1] 3709.6
    ## [1] 4182.655
    ## [1] 587.1236
    ## [1] 3195.009
    ## [1] 1538.796
    ## [1] 544.6853
    ## [1] 186.0623
    ## [1] 2458.305
    ## [1] 3478.048
    ## [1] 3956.309
    ## [1] 1356.15
    ## [1] 3968.337
    ## [1] 95.39079
    ## [1] 370.5825
    ## [1] 3740.593
    ## [1] 2563.221
    ## [1] 1321.816
    ## [1] 1947.67
    ## [1] 566.6176
    ## [1] 1987.521
    ## [1] 3561.746
    ## [1] 5447.243
    ## [1] 471.7588
    ## [1] 2921.854
    ## [1] 3447.975
    ## [1] 3061.518
    ## [1] 3953.902
    ## [1] 2195.826
    ## [1] 3306.256
    ## [1] 3192.27
    ## [1] 3961.818
    ## [1] 3051.838
    ## [1] 1914.219
    ## [1] 1509.433
    ## [1] 1286.721
    ## [1] 1074.272
    ## [1] 943.4166
    ## [1] 961.2316
    ## [1] 1370.558
    ## [1] 2327.418
    ## [1] 383.3725
    ## [1] 2789.073
    ## [1] 2986.608
    ## [1] 2774.706
    ## [1] 569.7421
    ## [1] 1612.704
    ## [1] 1156.132
    ## [1] 1464.266
    ## [1] 1166.655
    ## [1] 2738.007
    ## [1] 2453.246
    ## [1] 976.9385
    ## [1] 417.4334
    ## [1] 2821.645
    ## [1] 1687.6
    ## [1] 2876.44
    ## [1] 1569.006
    ## [1] 1594.359
    ## [1] 3317.868
    ## [1] 2954.584
    ## [1] 263.5447
    ## [1] 664.616
    ## [1] 403.1647
    ## [1] 1151.998
    ## [1] 654.9908
    ## [1] 501.0445
    ## [1] 445.8679
    ## [1] 1158.979
    ## [1] 1045.521
    ## [1] 1558.363
    ## [1] 1783.87
    ## [1] 1652.133
    ## [1] 976.7143
    ## [1] 1490.861
    ## [1] 2020.916
    ## [1] 3188.66
    ## [1] 1866.66
    ## [1] 4397.943
    ## [1] 4173.628
    ## [1] 3648.672
    ## [1] 2434.75
    ## [1] 331.3019
    ## [1] 1753.313
    ## [1] 2768.988
    ## [1] 1768.325
    ## [1] 3681.281
    ## [1] 3518.49
    ## [1] 1542.133
    ## [1] 1712.097
    ## [1] 4354.049
    ## [1] 1849.963
    ## [1] 4099.741
    ## [1] 1793.126
    ## [1] 319.922
    ## [1] 1673.301
    ## [1] 4115.946
    ## [1] 1652.733
    ## [1] 1631.609
    ## [1] 1540.163
    ## [1] 1766.654
    ## [1] 1999.916
    ## [1] 1752.101
    ## [1] 1601.884
    ## [1] 1776.614
    ## [1] 916.4138
    ## [1] 359.5369
    ## [1] 2163.452
    ## [1] 1127.481
    ## [1] 1964.561
    ## [1] 2579.912
    ## [1] 1635.191
    ## [1] 1781.51
    ## [1] 3040.937
    ## [1] 2644.879
    ## [1] 2090.844
    ## [1] 1699.768
    ## [1] 1276.52
    ## [1] 2284.888
    ## [1] 1407.341
    ## [1] 2301.222
    ## [1] 2126.862
    ## [1] 1984.807
    ## [1] 2015.201
    ## [1] 1092.536
    ## [1] 2950.076
    ## [1] 305.5077
    ## [1] 2581.804
    ## [1] 234.8593
    ## [1] 1373.216
    ## [1] 3226.331
    ## [1] 2583.287
    ## [1] 1395.059
    ## [1] 1832.522
    ## [1] 1440.788
    ## [1] 2289.985
    ## [1] 1042.282
    ## [1] 1793.254
    ## [1] 1600.639
    ## [1] 2300.788
    ## [1] 993.0298
    ## [1] 2091.17
    ## [1] 1153.215
    ## [1] 1902.658
    ## [1] 2489.098
    ## [1] 1428.869
    ## [1] 1606.389
    ## [1] 2707.31
    ## [1] 2389.933
    ## [1] 1901.466
    ## [1] 1387.903
    ## [1] 1473.704
    ## [1] 2207.435
    ## [1] 1062.692
    ## [1] 2222.838
    ## [1] 1918.834
    ## [1] 1736.565
    ## [1] 1947.865
    ## [1] 877.2334
    ## [1] 2628.14
    ## [1] 406.7631
    ## [1] 2316.207
    ## [1] 292.8393
    ## [1] 1552.243
    ## [1] 3455.768
    ## [1] 2332.828
    ## [1] 1228.329
    ## [1] 1720.614
    ## [1] 1309.482
    ## [1] 2210.242
    ## [1] 732.2734
    ## [1] 1647.304
    ## [1] 1469.136
    ## [1] 2220.425
    ## [1] 1056.022
    ## [1] 1079.271
    ## [1] 203.1014
    ## [1] 425.7259
    ## [1] 3346.412
    ## [1] 717.5932
    ## [1] 3822.203
    ## [1] 4059.054
    ## [1] 3808.732
    ## [1] 1583.383
    ## [1] 1496.476
    ## [1] 123.3469
    ## [1] 2528.774
    ## [1] 140.2316
    ## [1] 3782.685
    ## [1] 3509.831
    ## [1] 149.0495
    ## [1] 1308.652
    ## [1] 3873.512
    ## [1] 2429.775
    ## [1] 3949.838
    ## [1] 2315.577
    ## [1] 1403.793
    ## [1] 2558.404
    ## [1] 4025.579
    ## [1] 940.2772
    ## [1] 414.3291
    ## [1] 809.5483
    ## [1] 131.363
    ## [1] 1666.155
    ## [1] 575.68
    ## [1] 669.368
    ## [1] 142.5919
    ## [1] 1239.973
    ## [1] 876.1824
    ## [1] 1504.916
    ## [1] 2555.617
    ## [1] 966.5461
    ## [1] 3505.962
    ## [1] 3439.665
    ## [1] 3031.562
    ## [1] 1458.838
    ## [1] 669.2892
    ## [1] 1202.586
    ## [1] 1937.11
    ## [1] 1219.494
    ## [1] 3035.073
    ## [1] 2814.152
    ## [1] 931.1678
    ## [1] 753.254
    ## [1] 3488.893
    ## [1] 1418.448
    ## [1] 3349.081
    ## [1] 1314.547
    ## [1] 657.6403
    ## [1] 2500.998
    ## [1] 3391.12
    ## [1] 686.8854
    ## [1] 841.2722
    ## [1] 598.779
    ## [1] 1210.305
    ## [1] 1084.925
    ## [1] 891.9104
    ## [1] 704.4659
    ## [1] 1221.499
    ## [1] 162.5121
    ## [1] 628.7519
    ## [1] 3184.308
    ## [1] 643.3198
    ## [1] 3741.49
    ## [1] 3927.487
    ## [1] 3650.558
    ## [1] 1501.638
    ## [1] 1314.319
    ## [1] 326.4412
    ## [1] 2390.991
    ## [1] 343.3329
    ## [1] 3629.091
    ## [1] 3363.275
    ## [1] 56.49753
    ## [1] 1147.533
    ## [1] 3781.066
    ## [1] 2234.155
    ## [1] 3820.88
    ## [1] 2120.865
    ## [1] 1227.392
    ## [1] 2516.368
    ## [1] 3891.363
    ## [1] 791.6095
    ## [1] 305.7871
    ## [1] 648.0855
    ## [1] 334.1751
    ## [1] 1514.75
    ## [1] 489.0329
    ## [1] 526.9579
    ## [1] 345.3825
    ## [1] 1036.99
    ## [1] 3690.42
    ## [1] 987.8389
    ## [1] 4003.777
    ## [1] 4340.178
    ## [1] 4143.27
    ## [1] 1805.237
    ## [1] 1896.433
    ## [1] 302.5681
    ## [1] 2832.652
    ## [1] 285.6174
    ## [1] 4108.379
    ## [1] 3823.125
    ## [1] 573.876
    ## [1] 1669.423
    ## [1] 4078.139
    ## [1] 2839.739
    ## [1] 4226.381
    ## [1] 2724.046
    ## [1] 1796.705
    ## [1] 2704.888
    ## [1] 4312.109
    ## [1] 1293.781
    ## [1] 771.138
    ## [1] 1184.607
    ## [1] 294.6202
    ## [1] 2005.052
    ## [1] 882.3328
    ## [1] 1029.745
    ## [1] 283.4352
    ## [1] 1665.699
    ## [1] 2709.704
    ## [1] 1783.648
    ## [1] 1045.121
    ## [1] 475.9533
    ## [1] 2050.251
    ## [1] 2891.742
    ## [1] 3447.744
    ## [1] 942.5343
    ## [1] 3460.735
    ## [1] 492.69
    ## [1] 414.4806
    ## [1] 3219.018
    ## [1] 2038.324
    ## [1] 1607.971
    ## [1] 1364.84
    ## [1] 1009.833
    ## [1] 1401.181
    ## [1] 2976.551
    ## [1] 4860.17
    ## [1] 976.9316
    ## [1] 2407.339
    ## [1] 2937.502
    ## [1] 2538.618
    ## [1] 3446.586
    ## [1] 1685.779
    ## [1] 2808.267
    ## [1] 2678.048
    ## [1] 3455.148
    ## [1] 2476.255
    ## [1] 3107.326
    ## [1] 3360.402
    ## [1] 3158.04
    ## [1] 866.6808
    ## [1] 1602.868
    ## [1] 786.4837
    ## [1] 1845.164
    ## [1] 795.5731
    ## [1] 3121.229
    ## [1] 2835.313
    ## [1] 644.6509
    ## [1] 734.0774
    ## [1] 3156.035
    ## [1] 1994.006
    ## [1] 3248.57
    ## [1] 1874.73
    ## [1] 1556.178
    ## [1] 3117.882
    ## [1] 3330.149
    ## [1] 386.4584
    ## [1] 338.9733
    ## [1] 379.8008
    ## [1] 780.8794
    ## [1] 1030.575
    ## [1] 155.1129
    ## [1] 267.0347
    ## [1] 786.9519
    ## [1] 1108.229
    ## [1] 1098.244
    ## [1] 1703.707
    ## [1] 2241.122
    ## [1] 4067.394
    ## [1] 3876.572
    ## [1] 1648.957
    ## [1] 3882.681
    ## [1] 1577.989
    ## [1] 1394.55
    ## [1] 3749.472
    ## [1] 2767.388
    ## [1] 233.3231
    ## [1] 2872.434
    ## [1] 1010.2
    ## [1] 2848.028
    ## [1] 4110.127
    ## [1] 6006.734
    ## [1] 1149.466
    ## [1] 3009.097
    ## [1] 3436.89
    ## [1] 3166.629
    ## [1] 3868.37
    ## [1] 2421.427
    ## [1] 3256.903
    ## [1] 3234.908
    ## [1] 3872.346
    ## [1] 3507.959
    ## [1] 730.7418
    ## [1] 2550.326
    ## [1] 3862.244
    ## [1] 4142.628
    ## [1] 1538.804
    ## [1] 4152.932
    ## [1] 622.9073
    ## [1] 660.2513
    ## [1] 3951.638
    ## [1] 2804.237
    ## [1] 866.3775
    ## [1] 2393.395
    ## [1] 124.3859
    ## [1] 2415.703
    ## [1] 3935.639
    ## [1] 5845.623
    ## [1] 73.05969
    ## [1] 3137.097
    ## [1] 3645.754
    ## [1] 3287.012
    ## [1] 4138.255
    ## [1] 2427.072
    ## [1] 3487.646
    ## [1] 3401.004
    ## [1] 4145.022
    ## [1] 3388.366
    ## [1] 2454.241
    ## [1] 3357.164
    ## [1] 3907.584
    ## [1] 1340.523
    ## [1] 3920.18
    ## [1] 125.7886
    ## [1] 415.2036
    ## [1] 3683.902
    ## [1] 2503.156
    ## [1] 1491.7
    ## [1] 1808.56
    ## [1] 749.5336
    ## [1] 1855.986
    ## [1] 3444.59
    ## [1] 5316.698
    ## [1] 657.821
    ## [1] 2868.516
    ## [1] 3397.65
    ## [1] 3003.362
    ## [1] 3905.897
    ## [1] 2143.503
    ## [1] 3262.751
    ## [1] 3139.466
    ## [1] 3914.191
    ## [1] 2951.382
    ## [1] 2118.386
    ## [1] 1644.561
    ## [1] 1115.034
    ## [1] 1651.989
    ## [1] 2396.09
    ## [1] 2088.536
    ## [1] 1508.451
    ## [1] 747.5672
    ## [1] 2290.667
    ## [1] 1786.263
    ## [1] 2433.251
    ## [1] 1678.753
    ## [1] 2116.358
    ## [1] 3885.111
    ## [1] 2527.765
    ## [1] 821.826
    ## [1] 1196.374
    ## [1] 970.8603
    ## [1] 1637.44
    ## [1] 658.6866
    ## [1] 1015.798
    ## [1] 1008.608
    ## [1] 1642.334
    ## [1] 1530.2
    ## [1] 1608.855
    ## [1] 2441.467
    ## [1] 1625.034
    ## [1] 3384.209
    ## [1] 3210.249
    ## [1] 1369.275
    ## [1] 1387.835
    ## [1] 4025.378
    ## [1] 1576.806
    ## [1] 3785.46
    ## [1] 1508.985
    ## [1] 121.2025
    ## [1] 1984.48
    ## [1] 3805.971
    ## [1] 1355.13
    ## [1] 1403.729
    ## [1] 1255.392
    ## [1] 1620.799
    ## [1] 1669.153
    ## [1] 1502.407
    ## [1] 1335.835
    ## [1] 1631.519
    ## [1] 591.1181
    ## [1] 2617.553
    ## [1] 16.96281
    ## [1] 3878.976
    ## [1] 3602.356
    ## [1] 272.1752
    ## [1] 1412.611
    ## [1] 3934.667
    ## [1] 2549.527
    ## [1] 4032.005
    ## [1] 2434.896
    ## [1] 1513.418
    ## [1] 2589.374
    ## [1] 4110.697
    ## [1] 1040.477
    ## [1] 510.2441
    ## [1] 916.4931
    ## [1] 14.90484
    ## [1] 1764.081
    ## [1] 655.1378
    ## [1] 770.1479
    ## [1] 23.3484
    ## [1] 1363.207
    ## [1] 2628.725
    ## [1] 1288.133
    ## [1] 991.6509
    ## [1] 2416.809
    ## [1] 1266.938
    ## [1] 1586.503
    ## [1] 1284.796
    ## [1] 1436.193
    ## [1] 1236.292
    ## [1] 2495.298
    ## [1] 4411.227
    ## [1] 1500.737
    ## [1] 1599.655
    ## [1] 2114.497
    ## [1] 1748.509
    ## [1] 2614.134
    ## [1] 889.6716
    ## [1] 1963.284
    ## [1] 1865.599
    ## [1] 2621.494
    ## [1] 1909.79
    ## [1] 3891.184
    ## [1] 3614.012
    ## [1] 288.9665
    ## [1] 1426.181
    ## [1] 3941.738
    ## [1] 2565.531
    ## [1] 4042.108
    ## [1] 2450.822
    ## [1] 1529.333
    ## [1] 2595.68
    ## [1] 4121.23
    ## [1] 1053.616
    ## [1] 523.3058
    ## [1] 930.6392
    ## [1] 14.69864
    ## [1] 1776.701
    ## [1] 665.8263
    ## [1] 783.5213
    ## [1] 12.57309
    ## [1] 1380.138
    ## [1] 320.7725
    ## [1] 3660.782
    ## [1] 2481.994
    ## [1] 1366.514
    ## [1] 1852.319
    ## [1] 631.757
    ## [1] 1892.502
    ## [1] 3468.393
    ## [1] 5352.515
    ## [1] 549.9063
    ## [1] 2842.767
    ## [1] 3370
    ## [1] 2981.062
    ## [1] 3876.793
    ## [1] 2116.637
    ## [1] 3230.378
    ## [1] 3113.451
    ## [1] 3884.83
    ## [1] 2961.12
    ## [1] 3392.43
    ## [1] 2220.769
    ## [1] 1206.615
    ## [1] 1734.289
    ## [1] 606.8151
    ## [1] 1755.452
    ## [1] 3286.837
    ## [1] 5191.486
    ## [1] 598.7848
    ## [1] 2572.903
    ## [1] 3095.799
    ## [1] 2715.886
    ## [1] 3599.499
    ## [1] 1848.686
    ## [1] 2950.006
    ## [1] 2842.298
    ## [1] 3607.17
    ## [1] 2752.814
    ## [1] 1180.932
    ## [1] 3792.646
    ## [1] 2282.92
    ## [1] 3844.14
    ## [1] 2169.14
    ## [1] 1281.378
    ## [1] 2540.052
    ## [1] 3916.395
    ## [1] 819.529
    ## [1] 313.7382
    ## [1] 680.5835
    ## [1] 279.2855
    ## [1] 1544.865
    ## [1] 492.7481
    ## [1] 551.2238
    ## [1] 290.4524
    ## [1] 1092.259
    ## [1] 2764.099
    ## [1] 1273.744
    ## [1] 2703.025
    ## [1] 1154.742
    ## [1] 1398.979
    ## [1] 3246.697
    ## [1] 2763.701
    ## [1] 375.6825
    ## [1] 903.5815
    ## [1] 500.3652
    ## [1] 1412.286
    ## [1] 377.3019
    ## [1] 794.8393
    ## [1] 642.8769
    ## [1] 1421.272
    ## [1] 796.7541
    ## [1] 2762.927
    ## [1] 781.9266
    ## [1] 2747.54
    ## [1] 4074.899
    ## [1] 5983.956
    ## [1] 919.2433
    ## [1] 3028.962
    ## [1] 3478.963
    ## [1] 3186.592
    ## [1] 3927.248
    ## [1] 2405.678
    ## [1] 3302.143
    ## [1] 3265.64
    ## [1] 3931.863
    ## [1] 3479.538
    ## [1] 2338.408
    ## [1] 119.3063
    ## [1] 1675.902
    ## [1] 3510.539
    ## [1] 2329.177
    ## [1] 1610.576
    ## [1] 2080.147
    ## [1] 1676.376
    ## [1] 2553.702
    ## [1] 1135.353
    ## [1] 2023.091
    ## [1] 1837.216
    ## [1] 2564.283
    ## [1] 1290.549
    ## [1] 2355.13
    ## [1] 3856.255
    ## [1] 5769.832
    ## [1] 144.8695
    ## [1] 3031.51
    ## [1] 3537.087
    ## [1] 3182.464
    ## [1] 4027.421
    ## [1] 2325.724
    ## [1] 3377.34
    ## [1] 3294.071
    ## [1] 4034.054
    ## [1] 3301.992
    ## [1] 1603.615
    ## [1] 3461.09
    ## [1] 2353.324
    ## [1] 1491.425
    ## [1] 1963.014
    ## [1] 1558.279
    ## [1] 2438.877
    ## [1] 1024.671
    ## [1] 1904.405
    ## [1] 1719.096
    ## [1] 2449.408
    ## [1] 1191.666
    ## [1] 1918.574
    ## [1] 3880.615
    ## [1] 1333.076
    ## [1] 1337.441
    ## [1] 1222.522
    ## [1] 1525.778
    ## [1] 1699.201
    ## [1] 1447.389
    ## [1] 1290.045
    ## [1] 1536.325
    ## [1] 608.2035
    ## [1] 5788.527
    ## [1] 3063.608
    ## [1] 2791.849
    ## [1] 2914.921
    ## [1] 2603.847
    ## [1] 3585.317
    ## [1] 2967.295
    ## [1] 2900.513
    ## [1] 2608.115
    ## [1] 2504.631
    ## [1] 3100.279
    ## [1] 3611.821
    ## [1] 3249.158
    ## [1] 4106.568
    ## [1] 2386.893
    ## [1] 3455.563
    ## [1] 3365.384
    ## [1] 4113.487
    ## [1] 3337.278
    ## [1] 530.3122
    ## [1] 157.7062
    ## [1] 1039.544
    ## [1] 726.1381
    ## [1] 421.9565
    ## [1] 270.9504
    ## [1] 1048.269
    ## [1] 800.1452
    ## [1] 413.4745
    ## [1] 509.2343
    ## [1] 1254.213
    ## [1] 183.9603
    ## [1] 260.7292
    ## [1] 518.0002
    ## [1] 1001.088
    ## [1] 917.0673
    ## [1] 867.2039
    ## [1] 353.6515
    ## [1] 160.8461
    ## [1] 926.4676
    ## [1] 732.5906
    ## [1] 1762.433
    ## [1] 651.1905
    ## [1] 769.5578
    ## [1] 11.22971
    ## [1] 1371.163
    ## [1] 1122.73
    ## [1] 996.8391
    ## [1] 1770.776
    ## [1] 1091.897
    ## [1] 199.0853
    ## [1] 658.3522
    ## [1] 1043.273
    ## [1] 778.4679
    ## [1] 851.3423
    ## [1] 1382.372

**Bonus point if you can have the output of each iteration append a new
row to a dataframe, generating a new column of data. In other words, the
loop should create a dataframe with three columns called city1, city2,
and distance_km, as shown below. The first six rows of the dataframe are
shown below.**

``` r
library(tidyverse)

distance_df2 <- NULL #Creating a new data frame 

for (i in seq_along(citydata$city)) {
  if (i < length(citydata$city)) { 
    for (j in seq((i + 1), length(citydata$city))) { 
      lat1 <- citydata$lat[i]
      lon1 <- citydata$long[i]
      lat2 <- citydata$lat[j]
      lon2 <- citydata$long[j]

      distance_km <- dist(lat1, lon1, lat2, lon2)

      distance_df2 <- rbind( # Appending each city combination(city[i] and city [j], and their distances into the data frame after each iteration )
        distance_df2,
        data.frame(
          city1 = citydata$city[i],
          city2 = citydata$city[j],
          distance_km = distance_km
        )
      )
    }
  }
}

distance_df2
```

    ##             city1         city2 distance_km
    ## 1        New York   Los Angeles 3958.048142
    ## 2        New York       Chicago 1157.244902
    ## 3        New York         Miami 1758.654924
    ## 4        New York       Houston 2288.873018
    ## 5        New York        Dallas 2210.803332
    ## 6        New York  Philadelphia  127.910704
    ## 7        New York       Atlanta 1207.181259
    ## 8        New York    Washington  331.009234
    ## 9        New York        Boston  297.870299
    ## 10       New York       Phoenix 3449.901924
    ## 11       New York       Detroit  787.037915
    ## 12       New York       Seattle 3876.098259
    ## 13       New York San Francisco 4143.669186
    ## 14       New York     San Diego 3909.567479
    ## 15       New York   Minneapolis 1644.530966
    ## 16       New York         Tampa 1614.139563
    ## 17       New York      Brooklyn    5.344023
    ## 18       New York        Denver 2618.935383
    ## 19       New York        Queens   12.390192
    ## 20       New York     Riverside 3880.791511
    ## 21       New York     Las Vegas 3603.939096
    ## 22       New York     Baltimore  276.594418
    ## 23       New York     St. Louis 1415.028602
    ## 24       New York      Portland 3934.521928
    ## 25       New York   San Antonio 2553.272771
    ## 26       New York    Sacramento 4032.968240
    ## 27       New York        Austin 2438.589419
    ## 28       New York       Orlando 1518.734476
    ## 29       New York      San Juan 2593.334395
    ## 30       New York      San Jose 4111.827116
    ## 31       New York  Indianapolis 1042.692144
    ## 32       New York    Pittsburgh  512.409408
    ## 33       New York    Cincinnati  919.184232
    ## 34       New York     Manhattan   10.512499
    ## 35       New York   Kansas City 1766.069458
    ## 36       New York     Cleveland  656.302664
    ## 37       New York      Columbus  772.465853
    ## 38       New York         Bronx   18.035755
    ## 39       New York        Auburn 1367.853951
    ## 40    Los Angeles       Chicago 2812.100115
    ## 41    Los Angeles         Miami 3775.770950
    ## 42    Los Angeles       Houston 2221.811974
    ## 43    Los Angeles        Dallas 2011.484521
    ## 44    Los Angeles  Philadelphia 3861.195405
    ## 45    Los Angeles       Atlanta 3124.219180
    ## 46    Los Angeles    Washington 3709.600271
    ## 47    Los Angeles        Boston 4182.654810
    ## 48    Los Angeles       Phoenix  587.123574
    ## 49    Los Angeles       Detroit 3195.009075
    ## 50    Los Angeles       Seattle 1538.796480
    ## 51    Los Angeles San Francisco  544.685276
    ## 52    Los Angeles     San Diego  186.062270
    ## 53    Los Angeles   Minneapolis 2458.305266
    ## 54    Los Angeles         Tampa 3478.048340
    ## 55    Los Angeles      Brooklyn 3956.308909
    ## 56    Los Angeles        Denver 1356.150355
    ## 57    Los Angeles        Queens 3968.336910
    ## 58    Los Angeles     Riverside   95.390792
    ## 59    Los Angeles     Las Vegas  370.582506
    ## 60    Los Angeles     Baltimore 3740.593464
    ## 61    Los Angeles     St. Louis 2563.220760
    ## 62    Los Angeles      Portland 1321.816033
    ## 63    Los Angeles   San Antonio 1947.670296
    ## 64    Los Angeles    Sacramento  566.617618
    ## 65    Los Angeles        Austin 1987.521054
    ## 66    Los Angeles       Orlando 3561.746118
    ## 67    Los Angeles      San Juan 5447.242596
    ## 68    Los Angeles      San Jose  471.758782
    ## 69    Los Angeles  Indianapolis 2921.854170
    ## 70    Los Angeles    Pittsburgh 3447.974846
    ## 71    Los Angeles    Cincinnati 3061.517622
    ## 72    Los Angeles     Manhattan 3953.901787
    ## 73    Los Angeles   Kansas City 2195.825706
    ## 74    Los Angeles     Cleveland 3306.256025
    ## 75    Los Angeles      Columbus 3192.270248
    ## 76    Los Angeles         Bronx 3961.817755
    ## 77    Los Angeles        Auburn 3051.838222
    ## 78        Chicago         Miami 1914.219249
    ## 79        Chicago       Houston 1509.433149
    ## 80        Chicago        Dallas 1286.721373
    ## 81        Chicago  Philadelphia 1074.271885
    ## 82        Chicago       Atlanta  943.416588
    ## 83        Chicago    Washington  961.231552
    ## 84        Chicago        Boston 1370.557686
    ## 85        Chicago       Phoenix 2327.417959
    ## 86        Chicago       Detroit  383.372511
    ## 87        Chicago       Seattle 2789.073261
    ## 88        Chicago San Francisco 2986.608122
    ## 89        Chicago     San Diego 2774.706499
    ## 90        Chicago   Minneapolis  569.742135
    ## 91        Chicago         Tampa 1612.703860
    ## 92        Chicago      Brooklyn 1156.131812
    ## 93        Chicago        Denver 1464.266168
    ## 94        Chicago        Queens 1166.654978
    ## 95        Chicago     Riverside 2738.007157
    ## 96        Chicago     Las Vegas 2453.246153
    ## 97        Chicago     Baltimore  976.938506
    ## 98        Chicago     St. Louis  417.433351
    ## 99        Chicago      Portland 2821.644630
    ## 100       Chicago   San Antonio 1687.599809
    ## 101       Chicago    Sacramento 2876.440290
    ## 102       Chicago        Austin 1569.006223
    ## 103       Chicago       Orlando 1594.358636
    ## 104       Chicago      San Juan 3317.868479
    ## 105       Chicago      San Jose 2954.584348
    ## 106       Chicago  Indianapolis  263.544683
    ## 107       Chicago    Pittsburgh  664.615976
    ## 108       Chicago    Cincinnati  403.164689
    ## 109       Chicago     Manhattan 1151.997840
    ## 110       Chicago   Kansas City  654.990818
    ## 111       Chicago     Cleveland  501.044523
    ## 112       Chicago      Columbus  445.867872
    ## 113       Chicago         Bronx 1158.979167
    ## 114       Chicago        Auburn 1045.521257
    ## 115         Miami       Houston 1558.363222
    ## 116         Miami        Dallas 1783.870048
    ## 117         Miami  Philadelphia 1652.132839
    ## 118         Miami       Atlanta  976.714259
    ## 119         Miami    Washington 1490.861115
    ## 120         Miami        Boston 2020.916458
    ## 121         Miami       Phoenix 3188.660376
    ## 122         Miami       Detroit 1866.659630
    ## 123         Miami       Seattle 4397.942771
    ## 124         Miami San Francisco 4173.628346
    ## 125         Miami     San Diego 3648.672042
    ## 126         Miami   Minneapolis 2434.749960
    ## 127         Miami         Tampa  331.301936
    ## 128         Miami      Brooklyn 1753.313398
    ## 129         Miami        Denver 2768.988282
    ## 130         Miami        Queens 1768.324956
    ## 131         Miami     Riverside 3681.281058
    ## 132         Miami     Las Vegas 3518.490184
    ## 133         Miami     Baltimore 1542.133368
    ## 134         Miami     St. Louis 1712.097026
    ## 135         Miami      Portland 4354.048513
    ## 136         Miami   San Antonio 1849.962919
    ## 137         Miami    Sacramento 4099.740703
    ## 138         Miami        Austin 1793.125951
    ## 139         Miami       Orlando  319.921982
    ## 140         Miami      San Juan 1673.301393
    ## 141         Miami      San Jose 4115.945701
    ## 142         Miami  Indianapolis 1652.733086
    ## 143         Miami    Pittsburgh 1631.608888
    ## 144         Miami    Cincinnati 1540.162541
    ## 145         Miami     Manhattan 1766.653650
    ## 146         Miami   Kansas City 1999.915752
    ## 147         Miami     Cleveland 1752.100897
    ## 148         Miami      Columbus 1601.884394
    ## 149         Miami         Bronx 1776.613683
    ## 150         Miami        Auburn  916.413822
    ## 151       Houston        Dallas  359.536896
    ## 152       Houston  Philadelphia 2163.452402
    ## 153       Houston       Atlanta 1127.480642
    ## 154       Houston    Washington 1964.561332
    ## 155       Houston        Boston 2579.911702
    ## 156       Houston       Phoenix 1635.190843
    ## 157       Houston       Detroit 1781.509973
    ## 158       Houston       Seattle 3040.936957
    ## 159       Houston San Francisco 2644.879212
    ## 160       Houston     San Diego 2090.844088
    ## 161       Houston   Minneapolis 1699.767679
    ## 162       Houston         Tampa 1276.520312
    ## 163       Houston      Brooklyn 2284.888130
    ## 164       Houston        Denver 1407.341177
    ## 165       Houston        Queens 2301.222303
    ## 166       Houston     Riverside 2126.861805
    ## 167       Houston     Las Vegas 1984.806862
    ## 168       Houston     Baltimore 2015.200817
    ## 169       Houston     St. Louis 1092.535927
    ## 170       Houston      Portland 2950.076459
    ## 171       Houston   San Antonio  305.507673
    ## 172       Houston    Sacramento 2581.803575
    ## 173       Houston        Austin  234.859310
    ## 174       Houston       Orlando 1373.216243
    ## 175       Houston      San Juan 3226.330787
    ## 176       Houston      San Jose 2583.287476
    ## 177       Houston  Indianapolis 1395.058598
    ## 178       Houston    Pittsburgh 1832.522021
    ## 179       Houston    Cincinnati 1440.788217
    ## 180       Houston     Manhattan 2289.984502
    ## 181       Houston   Kansas City 1042.281902
    ## 182       Houston     Cleveland 1793.254356
    ## 183       Houston      Columbus 1600.639013
    ## 184       Houston         Bronx 2300.788462
    ## 185       Houston        Auburn  993.029780
    ## 186        Dallas  Philadelphia 2091.170378
    ## 187        Dallas       Atlanta 1153.215443
    ## 188        Dallas    Washington 1902.658003
    ## 189        Dallas        Boston 2489.098287
    ## 190        Dallas       Phoenix 1428.868822
    ## 191        Dallas       Detroit 1606.388887
    ## 192        Dallas       Seattle 2707.310189
    ## 193        Dallas San Francisco 2389.932762
    ## 194        Dallas     San Diego 1901.466429
    ## 195        Dallas   Minneapolis 1387.903003
    ## 196        Dallas         Tampa 1473.703538
    ## 197        Dallas      Brooklyn 2207.434995
    ## 198        Dallas        Denver 1062.691544
    ## 199        Dallas        Queens 2222.837509
    ## 200        Dallas     Riverside 1918.834019
    ## 201        Dallas     Las Vegas 1736.565219
    ## 202        Dallas     Baltimore 1947.865324
    ## 203        Dallas     St. Louis  877.233361
    ## 204        Dallas      Portland 2628.139824
    ## 205        Dallas   San Antonio  406.763100
    ## 206        Dallas    Sacramento 2316.207471
    ## 207        Dallas        Austin  292.839292
    ## 208        Dallas       Orlando 1552.243029
    ## 209        Dallas      San Juan 3455.768198
    ## 210        Dallas      San Jose 2332.827561
    ## 211        Dallas  Indianapolis 1228.329122
    ## 212        Dallas    Pittsburgh 1720.614418
    ## 213        Dallas    Cincinnati 1309.481883
    ## 214        Dallas     Manhattan 2210.241966
    ## 215        Dallas   Kansas City  732.273375
    ## 216        Dallas     Cleveland 1647.304187
    ## 217        Dallas      Columbus 1469.136365
    ## 218        Dallas         Bronx 2220.425320
    ## 219        Dallas        Auburn 1056.021720
    ## 220  Philadelphia       Atlanta 1079.270716
    ## 221  Philadelphia    Washington  203.101399
    ## 222  Philadelphia        Boston  425.725925
    ## 223  Philadelphia       Phoenix 3346.412231
    ## 224  Philadelphia       Detroit  717.593153
    ## 225  Philadelphia       Seattle 3822.202679
    ## 226  Philadelphia San Francisco 4059.053704
    ## 227  Philadelphia     San Diego 3808.731604
    ## 228  Philadelphia   Minneapolis 1583.383329
    ## 229  Philadelphia         Tampa 1496.475867
    ## 230  Philadelphia      Brooklyn  123.346898
    ## 231  Philadelphia        Denver 2528.774142
    ## 232  Philadelphia        Queens  140.231592
    ## 233  Philadelphia     Riverside 3782.684828
    ## 234  Philadelphia     Las Vegas 3509.831236
    ## 235  Philadelphia     Baltimore  149.049545
    ## 236  Philadelphia     St. Louis 1308.652477
    ## 237  Philadelphia      Portland 3873.511846
    ## 238  Philadelphia   San Antonio 2429.774800
    ## 239  Philadelphia    Sacramento 3949.837880
    ## 240  Philadelphia        Austin 2315.576846
    ## 241  Philadelphia       Orlando 1403.793484
    ## 242  Philadelphia      San Juan 2558.403698
    ## 243  Philadelphia      San Jose 4025.579301
    ## 244  Philadelphia  Indianapolis  940.277233
    ## 245  Philadelphia    Pittsburgh  414.329097
    ## 246  Philadelphia    Cincinnati  809.548325
    ## 247  Philadelphia     Manhattan  131.363023
    ## 248  Philadelphia   Kansas City 1666.155470
    ## 249  Philadelphia     Cleveland  575.679991
    ## 250  Philadelphia      Columbus  669.368021
    ## 251  Philadelphia         Bronx  142.591946
    ## 252  Philadelphia        Auburn 1239.973150
    ## 253       Atlanta    Washington  876.182368
    ## 254       Atlanta        Boston 1504.916452
    ## 255       Atlanta       Phoenix 2555.616547
    ## 256       Atlanta       Detroit  966.546089
    ## 257       Atlanta       Seattle 3505.962113
    ## 258       Atlanta San Francisco 3439.665470
    ## 259       Atlanta     San Diego 3031.562055
    ## 260       Atlanta   Minneapolis 1458.838428
    ## 261       Atlanta         Tampa  669.289179
    ## 262       Atlanta      Brooklyn 1202.586198
    ## 263       Atlanta        Denver 1937.110400
    ## 264       Atlanta        Queens 1219.494167
    ## 265       Atlanta     Riverside 3035.072998
    ## 266       Atlanta     Las Vegas 2814.151839
    ## 267       Atlanta     Baltimore  931.167790
    ## 268       Atlanta     St. Louis  753.254010
    ## 269       Atlanta      Portland 3488.892733
    ## 270       Atlanta   San Antonio 1418.447989
    ## 271       Atlanta    Sacramento 3349.081475
    ## 272       Atlanta        Austin 1314.547099
    ## 273       Atlanta       Orlando  657.640272
    ## 274       Atlanta      San Juan 2500.998052
    ## 275       Atlanta      San Jose 3391.120228
    ## 276       Atlanta  Indianapolis  686.885379
    ## 277       Atlanta    Pittsburgh  841.272239
    ## 278       Atlanta    Cincinnati  598.779030
    ## 279       Atlanta     Manhattan 1210.304536
    ## 280       Atlanta   Kansas City 1084.925292
    ## 281       Atlanta     Cleveland  891.910381
    ## 282       Atlanta      Columbus  704.465869
    ## 283       Atlanta         Bronx 1221.499330
    ## 284       Atlanta        Auburn  162.512077
    ## 285    Washington        Boston  628.751947
    ## 286    Washington       Phoenix 3184.308463
    ## 287    Washington       Detroit  643.319848
    ## 288    Washington       Seattle 3741.490058
    ## 289    Washington San Francisco 3927.487047
    ## 290    Washington     San Diego 3650.557567
    ## 291    Washington   Minneapolis 1501.637985
    ## 292    Washington         Tampa 1314.319345
    ## 293    Washington      Brooklyn  326.441211
    ## 294    Washington        Denver 2390.990991
    ## 295    Washington        Queens  343.332929
    ## 296    Washington     Riverside 3629.091306
    ## 297    Washington     Las Vegas 3363.275330
    ## 298    Washington     Baltimore   56.497529
    ## 299    Washington     St. Louis 1147.533490
    ## 300    Washington      Portland 3781.065791
    ## 301    Washington   San Antonio 2234.154529
    ## 302    Washington    Sacramento 3820.879707
    ## 303    Washington        Austin 2120.865418
    ## 304    Washington       Orlando 1227.392275
    ## 305    Washington      San Juan 2516.367632
    ## 306    Washington      San Jose 3891.362683
    ## 307    Washington  Indianapolis  791.609500
    ## 308    Washington    Pittsburgh  305.787073
    ## 309    Washington    Cincinnati  648.085492
    ## 310    Washington     Manhattan  334.175065
    ## 311    Washington   Kansas City 1514.750293
    ## 312    Washington     Cleveland  489.032882
    ## 313    Washington      Columbus  526.957920
    ## 314    Washington         Bronx  345.382479
    ## 315    Washington        Auburn 1036.990047
    ## 316        Boston       Phoenix 3690.419879
    ## 317        Boston       Detroit  987.838912
    ## 318        Boston       Seattle 4003.776747
    ## 319        Boston San Francisco 4340.178145
    ## 320        Boston     San Diego 4143.270460
    ## 321        Boston   Minneapolis 1805.236972
    ## 322        Boston         Tampa 1896.433282
    ## 323        Boston      Brooklyn  302.568130
    ## 324        Boston        Denver 2832.651959
    ## 325        Boston        Queens  285.617413
    ## 326        Boston     Riverside 4108.379261
    ## 327        Boston     Las Vegas 3823.125212
    ## 328        Boston     Baltimore  573.876046
    ## 329        Boston     St. Louis 1669.422924
    ## 330        Boston      Portland 4078.138948
    ## 331        Boston   San Antonio 2839.739057
    ## 332        Boston    Sacramento 4226.380991
    ## 333        Boston        Austin 2724.045671
    ## 334        Boston       Orlando 1796.705417
    ## 335        Boston      San Juan 2704.887972
    ## 336        Boston      San Jose 4312.109200
    ## 337        Boston  Indianapolis 1293.780875
    ## 338        Boston    Pittsburgh  771.138018
    ## 339        Boston    Cincinnati 1184.607343
    ## 340        Boston     Manhattan  294.620198
    ## 341        Boston   Kansas City 2005.051724
    ## 342        Boston     Cleveland  882.332847
    ## 343        Boston      Columbus 1029.745085
    ## 344        Boston         Bronx  283.435235
    ## 345        Boston        Auburn 1665.698527
    ## 346       Phoenix       Detroit 2709.704247
    ## 347       Phoenix       Seattle 1783.647744
    ## 348       Phoenix San Francisco 1045.121015
    ## 349       Phoenix     San Diego  475.953260
    ## 350       Phoenix   Minneapolis 2050.250979
    ## 351       Phoenix         Tampa 2891.742007
    ## 352       Phoenix      Brooklyn 3447.744078
    ## 353       Phoenix        Denver  942.534324
    ## 354       Phoenix        Queens 3460.735262
    ## 355       Phoenix     Riverside  492.690019
    ## 356       Phoenix     Las Vegas  414.480575
    ## 357       Phoenix     Baltimore 3219.018416
    ## 358       Phoenix     St. Louis 2038.324449
    ## 359       Phoenix      Portland 1607.970764
    ## 360       Phoenix   San Antonio 1364.840075
    ## 361       Phoenix    Sacramento 1009.832806
    ## 362       Phoenix        Austin 1401.181409
    ## 363       Phoenix       Orlando 2976.550662
    ## 364       Phoenix      San Juan 4860.170087
    ## 365       Phoenix      San Jose  976.931592
    ## 366       Phoenix  Indianapolis 2407.338512
    ## 367       Phoenix    Pittsburgh 2937.501990
    ## 368       Phoenix    Cincinnati 2538.618440
    ## 369       Phoenix     Manhattan 3446.585554
    ## 370       Phoenix   Kansas City 1685.779238
    ## 371       Phoenix     Cleveland 2808.266808
    ## 372       Phoenix      Columbus 2678.047816
    ## 373       Phoenix         Bronx 3455.147744
    ## 374       Phoenix        Auburn 2476.255232
    ## 375       Detroit       Seattle 3107.326430
    ## 376       Detroit San Francisco 3360.402164
    ## 377       Detroit     San Diego 3158.039735
    ## 378       Detroit   Minneapolis  866.680796
    ## 379       Detroit         Tampa 1602.867548
    ## 380       Detroit      Brooklyn  786.483722
    ## 381       Detroit        Denver 1845.164424
    ## 382       Detroit        Queens  795.573133
    ## 383       Detroit     Riverside 3121.228647
    ## 384       Detroit     Las Vegas 2835.312914
    ## 385       Detroit     Baltimore  644.650888
    ## 386       Detroit     St. Louis  734.077369
    ## 387       Detroit      Portland 3156.035233
    ## 388       Detroit   San Antonio 1994.005795
    ## 389       Detroit    Sacramento 3248.570448
    ## 390       Detroit        Austin 1874.729931
    ## 391       Detroit       Orlando 1556.177728
    ## 392       Detroit      San Juan 3117.882389
    ## 393       Detroit      San Jose 3330.149373
    ## 394       Detroit  Indianapolis  386.458425
    ## 395       Detroit    Pittsburgh  338.973264
    ## 396       Detroit    Cincinnati  379.800828
    ## 397       Detroit     Manhattan  780.879427
    ## 398       Detroit   Kansas City 1030.574721
    ## 399       Detroit     Cleveland  155.112867
    ## 400       Detroit      Columbus  267.034651
    ## 401       Detroit         Bronx  786.951902
    ## 402       Detroit        Auburn 1108.228789
    ## 403       Seattle San Francisco 1098.244045
    ## 404       Seattle     San Diego 1703.707467
    ## 405       Seattle   Minneapolis 2241.122134
    ## 406       Seattle         Tampa 4067.394000
    ## 407       Seattle      Brooklyn 3876.571776
    ## 408       Seattle        Denver 1648.957103
    ## 409       Seattle        Queens 3882.680544
    ## 410       Seattle     Riverside 1577.988535
    ## 411       Seattle     Las Vegas 1394.549844
    ## 412       Seattle     Baltimore 3749.471894
    ## 413       Seattle     St. Louis 2767.387843
    ## 414       Seattle      Portland  233.323083
    ## 415       Seattle   San Antonio 2872.433580
    ## 416       Seattle    Sacramento 1010.200459
    ## 417       Seattle        Austin 2848.028401
    ## 418       Seattle       Orlando 4110.127423
    ## 419       Seattle      San Juan 6006.734270
    ## 420       Seattle      San Jose 1149.465692
    ## 421       Seattle  Indianapolis 3009.096671
    ## 422       Seattle    Pittsburgh 3436.890391
    ## 423       Seattle    Cincinnati 3166.628897
    ## 424       Seattle     Manhattan 3868.370168
    ## 425       Seattle   Kansas City 2421.426782
    ## 426       Seattle     Cleveland 3256.902509
    ## 427       Seattle      Columbus 3234.908060
    ## 428       Seattle         Bronx 3872.346397
    ## 429       Seattle        Auburn 3507.958870
    ## 430 San Francisco     San Diego  730.741827
    ## 431 San Francisco   Minneapolis 2550.325896
    ## 432 San Francisco         Tampa 3862.244440
    ## 433 San Francisco      Brooklyn 4142.628045
    ## 434 San Francisco        Denver 1538.803971
    ## 435 San Francisco        Queens 4152.932437
    ## 436 San Francisco     Riverside  622.907250
    ## 437 San Francisco     Las Vegas  660.251299
    ## 438 San Francisco     Baltimore 3951.637541
    ## 439 San Francisco     St. Louis 2804.236562
    ## 440 San Francisco      Portland  866.377486
    ## 441 San Francisco   San Antonio 2393.395302
    ## 442 San Francisco    Sacramento  124.385881
    ## 443 San Francisco        Austin 2415.703153
    ## 444 San Francisco       Orlando 3935.638853
    ## 445 San Francisco      San Juan 5845.622751
    ## 446 San Francisco      San Jose   73.059688
    ## 447 San Francisco  Indianapolis 3137.096683
    ## 448 San Francisco    Pittsburgh 3645.753723
    ## 449 San Francisco    Cincinnati 3287.011768
    ## 450 San Francisco     Manhattan 4138.255361
    ## 451 San Francisco   Kansas City 2427.071948
    ## 452 San Francisco     Cleveland 3487.646215
    ## 453 San Francisco      Columbus 3401.004350
    ## 454 San Francisco         Bronx 4145.021583
    ## 455 San Francisco        Auburn 3388.365610
    ## 456     San Diego   Minneapolis 2454.241163
    ## 457     San Diego         Tampa 3357.164139
    ## 458     San Diego      Brooklyn 3907.584328
    ## 459     San Diego        Denver 1340.522626
    ## 460     San Diego        Queens 3920.179815
    ## 461     San Diego     Riverside  125.788621
    ## 462     San Diego     Las Vegas  415.203583
    ## 463     San Diego     Baltimore 3683.901880
    ## 464     San Diego     St. Louis 2503.156008
    ## 465     San Diego      Portland 1491.699657
    ## 466     San Diego   San Antonio 1808.560355
    ## 467     San Diego    Sacramento  749.533634
    ## 468     San Diego        Austin 1855.986337
    ## 469     San Diego       Orlando 3444.589580
    ## 470     San Diego      San Juan 5316.698109
    ## 471     San Diego      San Jose  657.821043
    ## 472     San Diego  Indianapolis 2868.515877
    ## 473     San Diego    Pittsburgh 3397.650139
    ## 474     San Diego    Cincinnati 3003.361826
    ## 475     San Diego     Manhattan 3905.896660
    ## 476     San Diego   Kansas City 2143.503486
    ## 477     San Diego     Cleveland 3262.750859
    ## 478     San Diego      Columbus 3139.465925
    ## 479     San Diego         Bronx 3914.191328
    ## 480     San Diego        Auburn 2951.381602
    ## 481   Minneapolis         Tampa 2118.385998
    ## 482   Minneapolis      Brooklyn 1644.560969
    ## 483   Minneapolis        Denver 1115.034376
    ## 484   Minneapolis        Queens 1651.989113
    ## 485   Minneapolis     Riverside 2396.090339
    ## 486   Minneapolis     Las Vegas 2088.536397
    ## 487   Minneapolis     Baltimore 1508.451263
    ## 488   Minneapolis     St. Louis  747.567222
    ## 489   Minneapolis      Portland 2290.666742
    ## 490   Minneapolis   San Antonio 1786.262942
    ## 491   Minneapolis    Sacramento 2433.250984
    ## 492   Minneapolis        Austin 1678.753160
    ## 493   Minneapolis       Orlando 2116.358301
    ## 494   Minneapolis      San Juan 3885.110777
    ## 495   Minneapolis      San Jose 2527.765266
    ## 496   Minneapolis  Indianapolis  821.826022
    ## 497   Minneapolis    Pittsburgh 1196.373976
    ## 498   Minneapolis    Cincinnati  970.860285
    ## 499   Minneapolis     Manhattan 1637.440498
    ## 500   Minneapolis   Kansas City  658.686607
    ## 501   Minneapolis     Cleveland 1015.797590
    ## 502   Minneapolis      Columbus 1008.607692
    ## 503   Minneapolis         Bronx 1642.333879
    ## 504   Minneapolis        Auburn 1530.200015
    ## 505         Tampa      Brooklyn 1608.854717
    ## 506         Tampa        Denver 2441.466732
    ## 507         Tampa        Queens 1625.033622
    ## 508         Tampa     Riverside 3384.208796
    ## 509         Tampa     Las Vegas 3210.248987
    ## 510         Tampa     Baltimore 1369.275398
    ## 511         Tampa     St. Louis 1387.834558
    ## 512         Tampa      Portland 4025.377681
    ## 513         Tampa   San Antonio 1576.806269
    ## 514         Tampa    Sacramento 3785.460363
    ## 515         Tampa        Austin 1508.985349
    ## 516         Tampa       Orlando  121.202504
    ## 517         Tampa      San Juan 1984.479919
    ## 518         Tampa      San Jose 3805.971327
    ## 519         Tampa  Indianapolis 1355.130164
    ## 520         Tampa    Pittsburgh 1403.729021
    ## 521         Tampa    Cincinnati 1255.392464
    ## 522         Tampa     Manhattan 1620.798667
    ## 523         Tampa   Kansas City 1669.152913
    ## 524         Tampa     Cleveland 1502.407242
    ## 525         Tampa      Columbus 1335.834756
    ## 526         Tampa         Bronx 1631.518633
    ## 527         Tampa        Auburn  591.118085
    ## 528      Brooklyn        Denver 2617.553147
    ## 529      Brooklyn        Queens   16.962814
    ## 530      Brooklyn     Riverside 3878.975650
    ## 531      Brooklyn     Las Vegas 3602.356145
    ## 532      Brooklyn     Baltimore  272.175231
    ## 533      Brooklyn     St. Louis 1412.611240
    ## 534      Brooklyn      Portland 3934.666654
    ## 535      Brooklyn   San Antonio 2549.526933
    ## 536      Brooklyn    Sacramento 4032.005281
    ## 537      Brooklyn        Austin 2434.895645
    ## 538      Brooklyn       Orlando 1513.417504
    ## 539      Brooklyn      San Juan 2589.374174
    ## 540      Brooklyn      San Jose 4110.696522
    ## 541      Brooklyn  Indianapolis 1040.477492
    ## 542      Brooklyn    Pittsburgh  510.244090
    ## 543      Brooklyn    Cincinnati  916.493146
    ## 544      Brooklyn     Manhattan   14.904841
    ## 545      Brooklyn   Kansas City 1764.080948
    ## 546      Brooklyn     Cleveland  655.137751
    ## 547      Brooklyn      Columbus  770.147927
    ## 548      Brooklyn         Bronx   23.348398
    ## 549      Brooklyn        Auburn 1363.207171
    ## 550        Denver        Queens 2628.724608
    ## 551        Denver     Riverside 1288.133252
    ## 552        Denver     Las Vegas  991.650885
    ## 553        Denver     Baltimore 2416.809456
    ## 554        Denver     St. Louis 1266.938401
    ## 555        Denver      Portland 1586.503020
    ## 556        Denver   San Antonio 1284.796336
    ## 557        Denver    Sacramento 1436.192657
    ## 558        Denver        Austin 1236.291724
    ## 559        Denver       Orlando 2495.298435
    ## 560        Denver      San Juan 4411.226952
    ## 561        Denver      San Jose 1500.736656
    ## 562        Denver  Indianapolis 1599.654896
    ## 563        Denver    Pittsburgh 2114.497332
    ## 564        Denver    Cincinnati 1748.509059
    ## 565        Denver     Manhattan 2614.134119
    ## 566        Denver   Kansas City  889.671567
    ## 567        Denver     Cleveland 1963.283966
    ## 568        Denver      Columbus 1865.598919
    ## 569        Denver         Bronx 2621.494099
    ## 570        Denver        Auburn 1909.789673
    ## 571        Queens     Riverside 3891.184144
    ## 572        Queens     Las Vegas 3614.012133
    ## 573        Queens     Baltimore  288.966472
    ## 574        Queens     St. Louis 1426.180708
    ## 575        Queens      Portland 3941.737530
    ## 576        Queens   San Antonio 2565.531096
    ## 577        Queens    Sacramento 4042.108475
    ## 578        Queens        Austin 2450.822341
    ## 579        Queens       Orlando 1529.333125
    ## 580        Queens      San Juan 2595.680403
    ## 581        Queens      San Jose 4121.229644
    ## 582        Queens  Indianapolis 1053.616271
    ## 583        Queens    Pittsburgh  523.305763
    ## 584        Queens    Cincinnati  930.639238
    ## 585        Queens     Manhattan   14.698642
    ## 586        Queens   Kansas City 1776.700525
    ## 587        Queens     Cleveland  665.826327
    ## 588        Queens      Columbus  783.521268
    ## 589        Queens         Bronx   12.573093
    ## 590        Queens        Auburn 1380.138245
    ## 591     Riverside     Las Vegas  320.772469
    ## 592     Riverside     Baltimore 3660.782272
    ## 593     Riverside     St. Louis 2481.993947
    ## 594     Riverside      Portland 1366.514251
    ## 595     Riverside   San Antonio 1852.319206
    ## 596     Riverside    Sacramento  631.757017
    ## 597     Riverside        Austin 1892.502010
    ## 598     Riverside       Orlando 3468.392835
    ## 599     Riverside      San Juan 5352.514893
    ## 600     Riverside      San Jose  549.906303
    ## 601     Riverside  Indianapolis 2842.767496
    ## 602     Riverside    Pittsburgh 3370.000131
    ## 603     Riverside    Cincinnati 2981.061758
    ## 604     Riverside     Manhattan 3876.792961
    ## 605     Riverside   Kansas City 2116.636882
    ## 606     Riverside     Cleveland 3230.378377
    ## 607     Riverside      Columbus 3113.451193
    ## 608     Riverside         Bronx 3884.829823
    ## 609     Riverside        Auburn 2961.119924
    ## 610     Las Vegas     Baltimore 3392.430493
    ## 611     Las Vegas     St. Louis 2220.768530
    ## 612     Las Vegas      Portland 1206.614813
    ## 613     Las Vegas   San Antonio 1734.289370
    ## 614     Las Vegas    Sacramento  606.815128
    ## 615     Las Vegas        Austin 1755.451986
    ## 616     Las Vegas       Orlando 3286.836885
    ## 617     Las Vegas      San Juan 5191.485779
    ## 618     Las Vegas      San Jose  598.784780
    ## 619     Las Vegas  Indianapolis 2572.903069
    ## 620     Las Vegas    Pittsburgh 3095.798708
    ## 621     Las Vegas    Cincinnati 2715.886115
    ## 622     Las Vegas     Manhattan 3599.499368
    ## 623     Las Vegas   Kansas City 1848.686386
    ## 624     Las Vegas     Cleveland 2950.005871
    ## 625     Las Vegas      Columbus 2842.297787
    ## 626     Las Vegas         Bronx 3607.170276
    ## 627     Las Vegas        Auburn 2752.814233
    ## 628     Baltimore     St. Louis 1180.931935
    ## 629     Baltimore      Portland 3792.645562
    ## 630     Baltimore   San Antonio 2282.920426
    ## 631     Baltimore    Sacramento 3844.140292
    ## 632     Baltimore        Austin 2169.139678
    ## 633     Baltimore       Orlando 1281.377763
    ## 634     Baltimore      San Juan 2540.051620
    ## 635     Baltimore      San Jose 3916.394539
    ## 636     Baltimore  Indianapolis  819.529021
    ## 637     Baltimore    Pittsburgh  313.738174
    ## 638     Baltimore    Cincinnati  680.583535
    ## 639     Baltimore     Manhattan  279.285450
    ## 640     Baltimore   Kansas City 1544.865348
    ## 641     Baltimore     Cleveland  492.748118
    ## 642     Baltimore      Columbus  551.223768
    ## 643     Baltimore         Bronx  290.452368
    ## 644     Baltimore        Auburn 1092.259475
    ## 645     St. Louis      Portland 2764.099288
    ## 646     St. Louis   San Antonio 1273.744129
    ## 647     St. Louis    Sacramento 2703.025447
    ## 648     St. Louis        Austin 1154.741559
    ## 649     St. Louis       Orlando 1398.979193
    ## 650     St. Louis      San Juan 3246.697163
    ## 651     St. Louis      San Jose 2763.700720
    ## 652     St. Louis  Indianapolis  375.682474
    ## 653     St. Louis    Pittsburgh  903.581467
    ## 654     St. Louis    Cincinnati  500.365178
    ## 655     St. Louis     Manhattan 1412.285821
    ## 656     St. Louis   Kansas City  377.301854
    ## 657     St. Louis     Cleveland  794.839319
    ## 658     St. Louis      Columbus  642.876946
    ## 659     St. Louis         Bronx 1421.272424
    ## 660     St. Louis        Auburn  796.754079
    ## 661      Portland   San Antonio 2762.926653
    ## 662      Portland    Sacramento  781.926635
    ## 663      Portland        Austin 2747.540003
    ## 664      Portland       Orlando 4074.899169
    ## 665      Portland      San Juan 5983.955953
    ## 666      Portland      San Jose  919.243319
    ## 667      Portland  Indianapolis 3028.962328
    ## 668      Portland    Pittsburgh 3478.963031
    ## 669      Portland    Cincinnati 3186.592099
    ## 670      Portland     Manhattan 3927.247707
    ## 671      Portland   Kansas City 2405.678023
    ## 672      Portland     Cleveland 3302.143408
    ## 673      Portland      Columbus 3265.639607
    ## 674      Portland         Bronx 3931.863406
    ## 675      Portland        Auburn 3479.537641
    ## 676   San Antonio    Sacramento 2338.407667
    ## 677   San Antonio        Austin  119.306278
    ## 678   San Antonio       Orlando 1675.902098
    ## 679   San Antonio      San Juan 3510.538941
    ## 680   San Antonio      San Jose 2329.176678
    ## 681   San Antonio  Indianapolis 1610.575799
    ## 682   San Antonio    Pittsburgh 2080.146723
    ## 683   San Antonio    Cincinnati 1676.376292
    ## 684   San Antonio     Manhattan 2553.701799
    ## 685   San Antonio   Kansas City 1135.352784
    ## 686   San Antonio     Cleveland 2023.090655
    ## 687   San Antonio      Columbus 1837.216044
    ## 688   San Antonio         Bronx 2564.282923
    ## 689   San Antonio        Auburn 1290.549232
    ## 690    Sacramento        Austin 2355.130188
    ## 691    Sacramento       Orlando 3856.255129
    ## 692    Sacramento      San Juan 5769.832271
    ## 693    Sacramento      San Jose  144.869502
    ## 694    Sacramento  Indianapolis 3031.509942
    ## 695    Sacramento    Pittsburgh 3537.086619
    ## 696    Sacramento    Cincinnati 3182.464184
    ## 697    Sacramento     Manhattan 4027.421227
    ## 698    Sacramento   Kansas City 2325.724373
    ## 699    Sacramento     Cleveland 3377.340474
    ## 700    Sacramento      Columbus 3294.070689
    ## 701    Sacramento         Bronx 4034.054282
    ## 702    Sacramento        Auburn 3301.992279
    ## 703        Austin       Orlando 1603.615004
    ## 704        Austin      San Juan 3461.090452
    ## 705        Austin      San Jose 2353.324296
    ## 706        Austin  Indianapolis 1491.425308
    ## 707        Austin    Pittsburgh 1963.013757
    ## 708        Austin    Cincinnati 1558.278885
    ## 709        Austin     Manhattan 2438.877448
    ## 710        Austin   Kansas City 1024.670705
    ## 711        Austin     Cleveland 1904.404594
    ## 712        Austin      Columbus 1719.096154
    ## 713        Austin         Bronx 2449.407795
    ## 714        Austin        Auburn 1191.665675
    ## 715       Orlando      San Juan 1918.574178
    ## 716       Orlando      San Jose 3880.614567
    ## 717       Orlando  Indianapolis 1333.076271
    ## 718       Orlando    Pittsburgh 1337.441024
    ## 719       Orlando    Cincinnati 1222.521927
    ## 720       Orlando     Manhattan 1525.778437
    ## 721       Orlando   Kansas City 1699.201207
    ## 722       Orlando     Cleveland 1447.388752
    ## 723       Orlando      Columbus 1290.045260
    ## 724       Orlando         Bronx 1536.325139
    ## 725       Orlando        Auburn  608.203511
    ## 726      San Juan      San Jose 5788.527051
    ## 727      San Juan  Indianapolis 3063.607862
    ## 728      San Juan    Pittsburgh 2791.848530
    ## 729      San Juan    Cincinnati 2914.921019
    ## 730      San Juan     Manhattan 2603.846845
    ## 731      San Juan   Kansas City 3585.317259
    ## 732      San Juan     Cleveland 2967.295457
    ## 733      San Juan      Columbus 2900.513308
    ## 734      San Juan         Bronx 2608.115269
    ## 735      San Juan        Auburn 2504.631225
    ## 736      San Jose  Indianapolis 3100.278603
    ## 737      San Jose    Pittsburgh 3611.821267
    ## 738      San Jose    Cincinnati 3249.157762
    ## 739      San Jose     Manhattan 4106.568335
    ## 740      San Jose   Kansas City 2386.892505
    ## 741      San Jose     Cleveland 3455.562566
    ## 742      San Jose      Columbus 3365.383568
    ## 743      San Jose         Bronx 4113.487127
    ## 744      San Jose        Auburn 3337.278134
    ## 745  Indianapolis    Pittsburgh  530.312248
    ## 746  Indianapolis    Cincinnati  157.706220
    ## 747  Indianapolis     Manhattan 1039.543742
    ## 748  Indianapolis   Kansas City  726.138108
    ## 749  Indianapolis     Cleveland  421.956542
    ## 750  Indianapolis      Columbus  270.950407
    ## 751  Indianapolis         Bronx 1048.268516
    ## 752  Indianapolis        Auburn  800.145244
    ## 753    Pittsburgh    Cincinnati  413.474509
    ## 754    Pittsburgh     Manhattan  509.234257
    ## 755    Pittsburgh   Kansas City 1254.213292
    ## 756    Pittsburgh     Cleveland  183.960350
    ## 757    Pittsburgh      Columbus  260.729235
    ## 758    Pittsburgh         Bronx  518.000186
    ## 759    Pittsburgh        Auburn 1001.087921
    ## 760    Cincinnati     Manhattan  917.067320
    ## 761    Cincinnati   Kansas City  867.203878
    ## 762    Cincinnati     Cleveland  353.651510
    ## 763    Cincinnati      Columbus  160.846051
    ## 764    Cincinnati         Bronx  926.467564
    ## 765    Cincinnati        Auburn  732.590623
    ## 766     Manhattan   Kansas City 1762.433334
    ## 767     Manhattan     Cleveland  651.190466
    ## 768     Manhattan      Columbus  769.557778
    ## 769     Manhattan         Bronx   11.229709
    ## 770     Manhattan        Auburn 1371.163251
    ## 771   Kansas City     Cleveland 1122.729729
    ## 772   Kansas City      Columbus  996.839059
    ## 773   Kansas City         Bronx 1770.776108
    ## 774   Kansas City        Auburn 1091.897001
    ## 775     Cleveland      Columbus  199.085317
    ## 776     Cleveland         Bronx  658.352197
    ## 777     Cleveland        Auburn 1043.272682
    ## 778      Columbus         Bronx  778.467948
    ## 779      Columbus        Auburn  851.342274
    ## 780         Bronx        Auburn 1382.372128

# Question 7

**Commit and push a gfm .md file to GitHub inside a directory called
Coding Challenge 6. Provide me a link to your github written as a
clickable link in your .pdf or .docx**
