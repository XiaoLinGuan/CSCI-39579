data1 <- read.csv("originaldata.csv")
dataMod <- data1[data1$month == "1",]
write.csv(dataMod, "dataMod.csv", row.names = FALSE)

data2 <- read.csv("dataMod.csv")
dataset <- data2[, 1:14]
write.csv(dataset, "dataset.csv", row.names = FALSE)