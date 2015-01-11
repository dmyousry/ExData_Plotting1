
##Reading the data file
data = read.table("household_power_consumption.txt", header = TRUE,
                  sep=";", fill=FALSE, strip.white=TRUE)

##Subsetting the data for 1/2/2007 and 2/2/2007
targetdata<-subset(data, (Date=="1/2/2007" | Date=="2/2/2007") & Global_active_power != "?")


##Plot 3
png("plot3.png",width = 480, height = 480, units = "px")
targetSub_metering_1<-as.numeric(as.character(targetdata$Sub_metering_1))
targetSub_metering_2<-as.numeric(as.character(targetdata$Sub_metering_2))
targetSub_metering_3<-as.numeric(as.character(targetdata$Sub_metering_3))

par(mar=c(3,5,2,2))
with(targetdata, plot(targettimevector, 
                      targetSub_metering_1,
                      type="l",
                      xlab = "",
                      ylab="Energy sub metering"))

with(targetdata, points(targettimevector, 
                        targetSub_metering_2,
                        type="l", 
                        col="red"))

with(targetdata, points(targettimevector, 
                        targetSub_metering_3,
                        type="l", 
                        col="blue"))

legend("topright", 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)
dev.off()
