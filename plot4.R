library(ggplot2)
library(dplyr)
library(magrittr)
library(tidyr)

input.filename <- '/Users/akcom/Projects/ExData_Plotting1/filtered.csv'
output.filename <- '/Users/akcom/Projects/ExData_Plotting1/plot4.png'

#preprocessed input file
df <- read.csv(input.filename,
               stringsAsFactors = FALSE)
df$DateTime <- as.POSIXct(strptime(df$DateTime, '%Y-%m-%d %T'))


p1 <- 
  ggplot(df) +
  geom_line(aes(x=DateTime, y=Global_active_power)) +
  scale_x_datetime(date_labels='%A', date_breaks='1 day') +
  labs(y='Global active power (kilowatts)',
       x='',
       title='')

p2 <- 
  ggplot(df) +
  geom_line(aes(x=DateTime, y=Voltage)) +
  scale_x_datetime(date_labels='%A', date_breaks='1 day') +
  labs(y='Voltage',
       x='datetime',
       title='')

p3 <- 
ggplot(df %>% gather(Description, Value, Sub_metering_1:Sub_metering_3)) +
  geom_line(aes(x=DateTime, y=Value, color=Description)) +
  scale_x_datetime(date_labels='%A', date_breaks='1 day') +
  labs(y='Energy Sub Reading',
       x='',
       title='')

p4 <- 
  ggplot(df) +
  geom_line(aes(x=DateTime, y=Global_reactive_power)) +
  scale_x_datetime(date_labels='%A', date_breaks='1 day') +
  labs(y='Voltage',
       x='datetime',
       title='')

plot_grid(p1, p2, p3, p4, ncol=2)

ggsave(output.filename, width=6, height=6, units='in', dpi=80)
