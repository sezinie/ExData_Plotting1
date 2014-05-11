Sys.setlocale("LC_TIME", "C")
sampledata <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, nrows=1)
classes <- sapply(sampledata, class)
household_power_consumption <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=classes, na.strings="?")
household_power_consumption$DateTime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time), "%d/%m/%Y %H:%M:%S")
household_power_consumption$Date<- as.Date(household_power_consumption$Date, "%d/%m/%Y")
Data.subset = subset(household_power_consumption, Date %in% as.Date(c("2007-02-01","2007-02-02")))

#Plot 2
png("plot2.png", width = 480, height = 480)
par(mfrow=c(1,1))
with(Data.subset, plot(DateTime,Global_active_power, type="l",xlab=" ",ylab="Global Active Power (kilowatts)"))
dev.off()