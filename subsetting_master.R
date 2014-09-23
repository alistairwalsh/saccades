load('master.R')
master_rested = subset(master, condition == 'Rested')
master_sd = subset(master, condition == 'Sleep.Deprived')

tail(master_rested)
tail(master_sd)

write.csv(master,'master.csv',row.names = FALSE)
write.csv(master_rested,'master_rested.csv',row.names = FALSE)
write.csv(master_sd,'master_sd.csv',row.names = FALSE)

test_read <- read.csv('master_sd.csv')
default = par(mar = c(5, 4, 4, 2) + 0.1)
par(mar = c(5, 14, 4, 2) + 0.1)
boxplot(Average.Speed~participant*condition,
        data = master,
        main = "Average Speed, sleep deprived and rested",
        outline=FALSE,
        las = 1,
        horizontal=TRUE)
library("ggplot2")
ggplot(aes(y = Peak.Speed,participant, fill = condition), data = master) + geom_boxplot()
par(mar = c(5, 4, 4, 2) + 0.1)
plot(master_rested$Amplitude,master_rested$Peak.Speed)
plot(master_sd$Amplitude,master_sd$Peak.Speed)
