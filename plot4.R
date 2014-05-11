Sys.setlocale("LC_TIME", "C")
sampledata <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, nrows=1)
classes <- sapply(sampledata, class)
household_power_consumption <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=classes, na.strings="?")
household_power_consumption$DateTime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time), "%d/%m/%Y %H:%M:%S")
household_power_consumption$Date<- as.Date(household_power_consumption$Date, "%d/%m/%Y")
Data.subset = subset(household_power_consumption, Date %in% as.Date(c("2007-02-01","2007-02-02")))


#Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
with(Data.subset, plot(DateTime,Global_active_power, type="l",xlab=" ",ylab="Global Active Power"))
with(Data.subset, plot(DateTime,Voltage, type="l",xlab="datetime",ylab="Voltage"))
with(Data.subset, plot(DateTime,Sub_metering_1,col="black", type="l", xlab="", ylab="Energy sub meeting"))
with(Data.subset, lines(DateTime,Sub_metering_2,col="red"))
with(Data.subset, lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


with(Data.subset, plot(DateTime,Global_reactive_power, type="l",xlab="datetime",ylab="Global_rective_power "))
dev.off()
