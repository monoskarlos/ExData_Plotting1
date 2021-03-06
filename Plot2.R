#set working directory
#setwd("C:/Users/egdbb48/ExploratoryDataAnalysis/CourseProject1")
#load the Houshold Power Consumption data set
HPC <- read.table(file="household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?",nrows = 2100000,colClasses = "character",strip.white=TRUE)
#tail(HPC,1)
# filter the datframe to pick up 2 days only
myHPC <- rbind(filter(HPC, HPC$Date == "1/2/2007"),filter(HPC, HPC$Date == "2/2/2007"))
rm(HPC) # remove initial big dataframe from memory

# Add the DateTime column and the DiffTime column; The Difftime is formatted for axis x
myHPC$DateTime <-paste(myHPC$Date,myHPC$Time)
myHPC$DiffTime <- as.numeric(difftime(strptime(as.character(myHPC[,"DateTime"]),format ="%d/%m/%Y %H:%M:%S"),strptime(as.character("1/2/2007 00:00:00"),format ="%d/%m/%Y %H:%M:%S"),units="days"))

# Draw plot on screen device; at first - no labels on axis x
library(datasets)
with(myHPC,plot(DiffTime,Global_active_power,xlab="",type="l",ylab = "Global Active Power (kilowatts)",xaxt='n') )
#Lable axis x as per task
# weekdays(as.Date(myHPC[,"Date"],format ="%d/%m/%Y")) - find week days of the range  result - Thursday and Friday, so labels should be set accordingly
# In the task there are only three ticks on axes x so there should be only min, avg and max DiffTime
axis(side=1,at=c(0.0,1.0,2.0),labels=c("Thu","Fri","Sat"))

## Copy plot to file device
dev.copy(png, file = "plot2.png",width = 480,height=480)
# Close both screen and png file grafic devices 
dev.off()
dev.off(dev.list()["RStudioGD"])