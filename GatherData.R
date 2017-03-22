gdpURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
eduURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
gdpFile <- tempfile()
eduFile <- tempfile()
download.file(gdpURL, gdpFile)
download.file(eduURL, eduFile)
