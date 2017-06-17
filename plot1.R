#Reading the Dataset
assignment_dataset <- read.table("C:/Users/Ranjan/Documents/Week1-Assignment/household_power_consumption.txt", sep = ";", header = TRUE, quote = "", na.strings = "?")
head(assignment_dataset)
str(assignment_dataset)
# Invoking the Lubridate package.
# I am intending to create a new date variable which is copy of the date variable
# Using lubridate, I would convert the new variable into only a weekday variable i.e. monday, tuesday, etc.
# This will be needed for the 2nd onwards graphs
library(lubridate)
assignment_dataset$Date <- dmy(assignment_dataset$Date)
str(assignment_dataset)
assignment_dataset$Date <- ymd(assignment_dataset$Date)
str(assignment_dataset)
assignment_dataset$Time <- hms(assignment_dataset$Time)
str(assignment_dataset)
# Creating a dataframe
assignment_datset_asdataframe <- tbl_df(assignment_dataset)
str(assignment_datset_asdataframe)
tail(assignment_datset_asdataframe)
library(dplyr)
tail(assignment_datset_asdataframe)
str(assignment_datset_asdataframe)
head(assignment_datset_asdataframe)
# Extracting the required dates from the dataframe using as.Date
assignment_datset_asdataframe[assignment_datset_asdataframe$Date <= as.Date("2009-02-02") & assignment_datset_asdataframe$Date >= as.Date("2007-02-01"),]
weekday_dataset <- assignment_datset_asdataframe[assignment_datset_asdataframe$Date <= as.Date("2009-02-02") & assignment_datset_asdataframe$Date >= as.Date("2007-02-01"),]
str(weekday_dataset)
head(weekday_dataset)
weekday_dataset$created_weekday <- format(weekday_dataset$Date, "%a")
weekday_dataset$created_weekday
str(weekday_dataset)
weekday_dataset
# Finally creating the 1st Histogram
par(bg = "grey")
hist(weekday_dataset$Global_active_power,
     col = "red",
     xlab = "Global Active Power",
     ylab = "Frequency",
     main = "Global Active Power",
     xlim = c(0, 6))
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()