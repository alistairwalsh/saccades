'''
To calculate the moving average
all average speed values with a particular minute label is averaged.
The mean values for each minute are then put in the vector 'gather'
for later use i.e. plotting

'''



gather = NULL
for (i in as.integer((levels(dfile$Minute)))){
  gather[i] = mean(dfile$Average.Speed[dfile$Minute == i])
  
}

plot(gather)