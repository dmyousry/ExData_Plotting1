
##Reading the data file
data = read.table("household_power_consumption.txt", header = TRUE,
                  sep=";", fill=FALSE, strip.white=TRUE)

##Subsetting the data for 1/2/2007 and 2/2/2007
targetdata<-subset(data, (Date=="1/2/2007" | Date=="2/2/2007") & Global_active_power != "?")


##Plot 1

png("plot1.png",width = 480, height = 480, units = "px")
par(mar=c(5,5,2,2))
hist(as.numeric(as.character(targetdata$Global_active_power)), freq=TRUE,
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",col="red")
dev.off()