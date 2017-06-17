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
## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(assignment_subset, {
  plot(Global_active_power~Date_Time_Combined, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Date_Time_Combined, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Date_Time_Combined, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Date_Time_Combined,col = 'Red')
  lines(Sub_metering_3~Date_Time_Combined,col = 'Blue')
    plot(Global_reactive_power~Date_Time_Combined, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()