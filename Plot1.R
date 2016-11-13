#setwd("C:/Users/egdbb48/ExploratoryDataAnalysis/CourseProject1")

HPC <- read.table(file="household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?",nrows = 2100000,colClasses = "character",strip.white=TRUE)
tail(HPC,1)

myHPC <- rbind(filter(HPC, HPC$Date == "1/2/2007"),filter(HPC, HPC$Date == "2/2/2007"))
rm(HPC)

## Draw plot on screen device
library(datasets)
hist(as.numeric(myHPC$Global_active_power),main="Global Active Power",xlab = "Global Active Power (kilowatts)",col="Red")

## Copy plot to file device
dev.copy(png, file = "plot1.png",width = 480,height=480)
dev.off()