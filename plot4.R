
##Reading the data file
data = read.table("household_power_consumption.txt", header = TRUE,
                  sep=";", fill=FALSE, strip.white=TRUE)

##Subsetting the data for 1/2/2007 and 2/2/2007
targetdata<-subset(data, (Date=="1/2/2007" | Date=="2/2/2007") & Global_active_power != "?")


##Plot 4

png("plot4.png",width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
par(mar=c(3,5,2,2))
with(targetdata, plot(targettimevector, targetGlobal_active_power,type="l",
                      xlab = "",ylab="Global Active Power (kilowatts)"))

targetvoltage<-as.numeric(as.character(targetdata$Voltage))
with(targetdata, plot(targettimevector, targetvoltage,type="l",
                      xlab = "datetime",ylab="Voltage"))



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
       col = c("black", "red", "blue"), bty='n', cex=0.8,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)

targetGlobal_reactive_power<-as.numeric(as.character(targetdata$Global_reactive_power))
with(targetdata, plot(targettimevector, targetGlobal_reactive_power,type="l",
                      xlab = "datetime",ylab="Global_reactive_power"))
dev.off()
