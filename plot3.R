#Reading the assignment data
assignment_dataset <- read.table("C:/Users/Ranjan/Documents/Week1-Assignment/household_power_consumption.txt", sep = ";", header = TRUE, quote = "", na.strings = "?")
# Subsetting the dataset
assignment_subset <- subset(assignment_dataset, Date %in% c("1/2/2007","2/2/2007"))
# formating the factor date variable as Date variable
assignment_subset$Date <- as.Date(assignment_subset$Date, format="%d/%m/%Y")
# combining the date and times into a single charecter variable using paste
date_time_combined <- paste(as.Date(assignment_subset$Date), assignment_subset$Time)
# The combined date time variable is read as a date/time variable
assignment_subset$Date_Time_Combined <- as.POSIXct(date_time_combined)
## Plot 3
with(assignment_subset, {
  plot(Sub_metering_1~Date_Time_Combined, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Date_Time_Combined, col='Red')
  lines(Sub_metering_3~Date_Time_Combined, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()