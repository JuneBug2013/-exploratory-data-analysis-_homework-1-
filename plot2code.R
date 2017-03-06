### set work directory 
getwd()
setwd("/Users/jwang/Documents/Coursera/Exploratory Data Analysis")
### download data and unzip it
if(!file.exists('household_power_consumption.zip')) {
  fileurl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
  download.file(fileurl, destfile= "household_power_consumption.zip")}
unzip("household_power_consumption.zip")

### read data into R
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")
### get the specific data wanted
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
### using strptime function to convert character representations to  objects of classes "POSIXlt" and "POSIXct" representing calendar dates and times.
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" ", "%d/%m/%Y %H:%M:%S") 
 
### create plot2 
png('plot2.png',width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
plot(datetime,as.numeric(subSetData$Global_active_power),type="l", xlab ="",ylab="Global Active Power(Kilowatts)")
dev.off()             