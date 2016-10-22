library(ggplot2)
library(dplyr)
library(magrittr)
library(cowplot)

input.filename <- '/Users/akcom/Projects/ExData_Plotting1/filtered.csv'
output.filename <- '/Users/akcom/Projects/ExData_Plotting1/plot2.png'

#preprocessed input file
df <- read.csv(input.filename,
               stringsAsFactors = FALSE)
df$DateTime <- strptime(df$DateTime, '%Y-%m-%d %T')

ggplot(df) +
  geom_line(aes(x=DateTime, y=Global_active_power)) +
  scale_x_datetime(date_labels='%A', date_breaks='1 day') +
  labs(y='Global active power (kilowatts)',
       x='',
       title='')

ggsave(output.filename, width=6, height=6, units='in', dpi=80)
