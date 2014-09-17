
if (!file.exists('~/saccades/data')){
  dir.create('~/saccades/data')
}

link = 'https://www.dropbox.com/s/e5wqj9mqrcu3vjz/Archive.zip?dl=0'
# method = wget is appropriate for Linux, curl might be better for OSX
download.file(link, destfile = '~/saccades/data/Archive.zip', method = 'wget')

# change list to FALSE to actually unzip files
unzip('~/saccades/data/Archive.zip',exdir = "~/saccades/data/", list = FALSE)

