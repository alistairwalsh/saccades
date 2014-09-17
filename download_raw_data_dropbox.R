link = 'https://www.dropbox.com/s/64y50x80njhpq4b/raw%20data.zip?dl=0'
# method = wget is appropriate for Linux, curl might be better for OSX
download.file(link,'data.zip', method = 'curl')

# change list to FALSE to actually unzip files
unzip('data.zip',list = TRUE)
