
# method = wget is appropriate for Linux, curl might be better for OSX
download.file('https://www.dropbox.com/s/64y50x80njhpq4b/raw%20data.zip?dl=1'
              ,'data.zip'
              , method = 'wget')

# change list to FALSE to actually unzip files
unzip('data.zip',list = TRUE)
