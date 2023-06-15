dataa <- readr::read_delim(file = 'household_power_consumption'
                           ,delim = ';')
dataa$Date <- dmy(dataa$Date)
dataa <- filter(.data = dataa,Date>='2007/02/01'&Date<='2007/02/02')
png(filename = 'plot1.png',width = 480,height = 480)
hist(dataa$Global_active_power,col = 'red',main = 'Global active power')
dev.off()