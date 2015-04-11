start<-grep("1/2/2007", readLines("household_power_consumption.txt"))[1]
end<-grep("3/2/2007", readLines("household_power_consumption.txt"))[1]-grep("1/2/2007", readLines("household_power_consumption.txt"))[1]-1
d=read.table("household_power_consumption.txt", sep=";", header=F, skip=start, nrow=end)
a=read.table("household_power_consumption.txt", sep=";", header=T, nrow=1)
colnames(d)=colnames(a)

time<-paste(d$Date, d$Time)
time1<-strptime(time, "%d/%m/%Y %H:%M:%S")
d$actual_time<-time1


png(filename = "plot2.png",width = 480, height = 480)
plot(d$actual_time, d$Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
dev.off()