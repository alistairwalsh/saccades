'''
To create factors (labels) labelling minutes of the trial 
which will be used for calculating averages per minute. 
The conversion from micro seconds to minutes is the STATA file is 
done here.

N.B. The last section is usually 
not a full minute and the cut function will assign the last values 
a NA value
Adding a final value to 'minutes' solves this.

'''

start_time = dfile$Start[1]
end_time = dfile$Start[length(dfile$Start)]
length_in_minutes = ((end_time - start_time)/1000000)/60
interval = 60*1000000
minutes = seq(from = start_time, to = end_time, by = interval)
minutes_x = append(minutes,dfile$Start[length(dfile$Start)])


dfile$Minute = factor(cut(dfile$Start
    , minutes_x
    , labels = FALSE
    ,include.lowest = TRUE))
