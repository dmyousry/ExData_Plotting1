
##Reading the data file
data = read.table("household_power_consumption.txt", header = TRUE,
                  sep=";", fill=FALSE, strip.white=TRUE)

##Subsetting the data for 1/2/2007 and 2/2/2007
targetdata<-subset(data, (Date=="1/2/2007" | Date=="2/2/2007") & Global_active_power != "?")

##Plot 2
png("plot2.png",width = 480, height = 480, units = "px")
targettimevector<-strptime(paste(as.Date(targetdata$Date,"%d/%m/%Y"), targetdata$Time), "%Y-%m-%d %H:%M:%S")
targetGlobal_active_power<-as.numeric(as.character(targetdata$Global_active_power))
par(mar=c(3,5,2,2))
with(targetdata, plot(targettimevector, targetGlobal_active_power,type="l",
                      xlab = "",ylab="Global Active Power (kilowatts)"))
dev.off()

