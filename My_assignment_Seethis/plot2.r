dataa <- readr::read_delim(file = 'household_power_consumption'
                           ,delim = ';')
dataa$Date <- dmy(dataa$Date)
dataa <- filter(.data = dataa,Date>='2007/02/01'&Date<='2007/02/02')
time <- as.POSIXct(paste(dataa$Date, dataa$Time),
                   format="%Y-%m-%d %H:%M:%S")
png(filename = 'plot2.png',width = 480,height = 480)
plot(x = time,y = dataa$Global_active_power,type = 'l',
     ylab = 'Global active power',xlab = '',xaxt = 'n')
axis(1,at = c(time[1],median(time),time[length(time)]),
     labels = c('Thu','Fri','Sat'))
dev.off()