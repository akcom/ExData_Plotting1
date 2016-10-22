library(ggplot2)
library(dplyr)
library(magrittr)
library(cowplot)

input.filename <- '/Users/akcom/Projects/ExData_Plotting1/filtered.csv'
output.filename <- '/Users/akcom/Projects/ExData_Plotting1/plot1.png'

#preprocessed input file
df <- read.csv(input.filename,
               stringsAsFactors = FALSE)
df$DateTime <- strptime(df$DateTime, '%Y-%m-%d %T')

ggplot(df) +
  geom_histogram(aes(x=Global_active_power),
                 binwidth=0.5,
                 fill='red',
                 color='black') +
  labs(x='Global active power (kilowatts)',
       y='Frequency',
       title='Global Active Power')

ggsave(output.filename, width=6, height=6, units='in', dpi=80)