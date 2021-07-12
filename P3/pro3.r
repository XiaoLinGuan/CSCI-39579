library(dplyr)

data <- read.csv("C:/Users/xiaol/OneDrive/Summer2021/CSCI39579_Data_Visualization/Project/P3/NYC_Dog_Licensing_Data.csv")
print(ncol(data))
print(nrow(data))
View(data)

randomSample <- data %>% sample_n(5000)
print(ncol(randomSample))
print(nrow(randomSample))
View(randomSample)
write.csv(randomSample, "randomSample.csv", row.names = FALSE)
