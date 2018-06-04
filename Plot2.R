#Download household_power_consumption.txt and save it in a folder. Set that folder as your working directory. 
#Afterwards, run the below code. It should take around 30 seconds. The PNG file should then appear in that folder.

#loading, preprocessing and subsetting
par(mar=c(5.1, 4.1, 4.1, 2.1), mfrow = c(1,1)) #to reset the parameters
pc = read.table("household_power_consumption.txt", sep =";", header = TRUE, na.strings="?")
pc$ExactTime = as.POSIXct(paste(pc$Date, pc$Time), format="%d/%m/%Y %H:%M:%S")
lower.bound = as.POSIXct("01-02-2007", format="%d-%m-%Y")
upper.bound = as.POSIXct("03-02-2007", format="%d-%m-%Y")
subset.pc = subset(pc, ExactTime > lower.bound & ExactTime < upper.bound)

#plotting
plot(subset.pc$ExactTime, subset.pc$Global_active_power, type = "l", xlab = "", ylab = "Global active powers (kilowatt)")
dev.copy(png, file = "plot2.png",  width=480, height=480)
dev.off()
cat("Plot2.png is generated and is stored in your current directory:",getwd())