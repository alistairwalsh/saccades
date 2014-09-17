link = 'https://www.dropbox.com/s/zgz3raq6q2cf138/start_time_machine_readable.csv?dl=0'

# method = wget is appropriate for Linux, curl might be better for OSX
destfile = '~/saccades/start_time_machine_readable.csv'
download.file(link, destfile, method = 'wget')

# create datatable
start_times = read.csv( file = 'start_time_machine_readable.csv'
          ,header = TRUE
          ,sep = ',')
