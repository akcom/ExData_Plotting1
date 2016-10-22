library(dplyr)
library(magrittr)

#set our input and output info
input.filename <- '/Users/akcom/Downloads/household_power_consumption.txt'
output.filename <- '/Users/akcom/Projects/ExData_Plotting1/filtered.csv'

#filter down to only the data we need
start.dt <- as.Date('01/02/2007', '%d/%m/%Y')
end.dt <- as.Date('02/02/2007', '%d/%m/%Y')

df <- read.csv(input.filename,
               na.strings = "?",
               stringsAsFactors=FALSE,
               sep=";")

df$DateFmt <- as.Date(df$Date, '%d/%m/%Y')
df <- df %>% filter(DateFmt == start.dt | DateFmt == end.dt)
df$DateTime <- strptime(paste(df$Date, df$Time), '%d/%m/%Y %T')
df <- df %>% select(DateTime,
                    Global_active_power,
                    Sub_metering_1,
                    Sub_metering_2,
                    Sub_metering_3,
                    Global_reactive_power,
                    Voltage)
write.csv(df, output.filename)