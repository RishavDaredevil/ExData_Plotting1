dataa <- readr::read_delim(file = 'household_power_consumption'
                           ,delim = ';')
dataa$Date <- dmy(dataa$Date)
dataa <- filter(.data = dataa,Date>='2007/02/01'&Date<='2007/02/02')
time <- as.POSIXct(paste(dataa$Date, dataa$Time),
                   format="%Y-%m-%d %H:%M:%S")
png(filename = 'plot4.png',width = 480,height = 480)
par(mfcol=c(2,2))
plot(x = time,y = dataa$Global_active_power,type = 'l',
     ylab = 'Global active power',xlab = '',xaxt = 'n')
axis(1,at = c(time[1],median(time),time[length(time)]),
     labels = c('Thu','Fri','Sat'))
plot(x = time,y = dataa$Sub_metering_1,type = 'l',
     ylab = 'Energy sub metering',xlab = '',xaxt = 'n')
points(x = time,y = dataa$Sub_metering_2,col = 'red',type = 'l')
points(x = time,y = dataa$Sub_metering_3,col = 'blue',type = 'l')
axis(1,at = c(time[1],median(time),time[length(time)]),
     labels = c('Thu','Fri','Sat'))
legend("topright", legend = c("Sub_metering_1",
                              "Sub_metering_2",'Sub_metering_3'),
       lwd = 1,bty = 'n',col = c('black',"red", "blue"))
plot(x = time,y = dataa$Voltage,type = 'l',
     ylab = 'Voltage',xlab = '',xaxt = 'n')
axis(1,at = c(time[1],median(time),time[length(time)]),
     labels = c('Thu','Fri','Sat'))
plot(x = time,y = dataa$Global_reactive_power,type = 'l',
     ylab = 'Global_reactive_power',xlab = '',xaxt = 'n')
axis(1,at = c(time[1],median(time),time[length(time)]),
     labels = c('Thu','Fri','Sat'))
dev.off()