start<-grep("1/2/2007", readLines("household_power_consumption.txt"))[1]
end<-grep("3/2/2007", readLines("household_power_consumption.txt"))[1]-grep("1/2/2007", readLines("household_power_consumption.txt"))[1]-1
d=read.table("household_power_consumption.txt", sep=";", header=F, skip=start, nrow=end)
a=read.table("household_power_consumption.txt", sep=";", header=T, nrow=1)
colnames(d)=colnames(a)


png(filename = "plot1.png",width = 480, height = 480)
hist(d$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()
