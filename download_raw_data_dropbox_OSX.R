
if (!file.exists('./data')){
  dir.create('./data')
}

link = 'https://www.dropbox.com/s/e5wqj9mqrcu3vjz/Archive.zip?dl=1'
# method = wget is appropriate for Linux, curl might be better for OSX
download.file(link, destfile = './data/Archive.zip',method = 'curl')

# change list to FALSE to actually unzip files
unzip('./data/Archive.zip',exdir = "~/Documents/Rprojects/saccades/data/", list = FALSE)


https://www.dropbox.com/s/e5wqj9mqrcu3vjz/Archive.zip?dl=0
