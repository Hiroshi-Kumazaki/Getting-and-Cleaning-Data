url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url, destfile = "download-file.csv")
file <- read.csv("download-file.csv")
sum(file$VAL == 24, na.rm = TRUE)

library(readxl)

url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url2, destfile = "NGAP.xlsx", method = "curl")
dat <- read_xlsx("NGAP.xlsx",range = "G18:O23")
sum(dat$Zip*dat$Ext,na.rm=T)

library(XML)

url3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(url3, destfile = "BaltimoreRestaurant.xml", method = "curl")
doc <- xmlTreeParse("BaltimoreRestaurant.xml", useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)

zipcodefinder <- xpathSApply(rootNode, "//zipcode", xmlValue)

sum(zipcodefinder == 21231)


url4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
install.packages("data.table")
library(r-data.table)
download.file(url4, destfile = "download-file4.csv")
DT <- fread("download-file4.csv")

rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
mean(DT[DT$SEX==1, ]$pwgtp15); mean(DT[DT$SEX==2, ]$pwgtp15)
DT[, mean(pwgtp15), by=SEX]
tapply(DT$pwgtp15, DT$SEX, mean)
mean(DT$pwgtp15, by=DT$SEX)
sapply(split(DT$pwgtp15, DT$SEX), mean)