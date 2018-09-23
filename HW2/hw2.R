#Part I
#1.
V <- c(35, 4, 12, 2, 14, 11, 9, 5, 11, 3, 38, 12, 1, 0, 4, 2)
V
#2.
A <- matrix(V, nrow = 4, ncol = 4)
A
#3.
#a.
Aa <- solve(A)
Aa
det(Aa)
#b.
Ab <- A %*% t(A)
Ab
det(Ab)
#c.
Ac <- t(A) %*% A
Ac
det(Ac)

#Part II
#1.
library("readxl")
aqi <- read_excel("D:/三/上/Big Data/hw/hw2/AQI.xlsx")
aqi.tran <- data.frame(aqi)
#2.
new_aqi <- aqi.tran[c("SiteName", "County", "AQI", "Status", "CO", "O3", "PM2.5")]
#3.
aqi_df1 <- new_aqi[1:10, 1:7]
aqi_df2 <- new_aqi[11:20, 1:7]
aqi_df3 <- new_aqi[21:30, 1:7]
aqi_df4 <- new_aqi[31:40, 1:7]
aqi_df5 <- new_aqi[41:50, 1:7]
aqi_df6 <- new_aqi[51:60, 1:7]
aqi_df7 <- new_aqi[61:70, 1:7]
aqi_df8 <- new_aqi[71:76, 1:7]
aqi_list <- list("first"=aqi_df1, "second"=aqi_df2, "third"=aqi_df3, "fourth"=aqi_df4, "fifth"=aqi_df5,
                 "sixth"=aqi_df6, "seventh"=aqi_df7, "last"=aqi_df8)
aqi_list
