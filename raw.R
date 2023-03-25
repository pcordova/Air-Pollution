install.packages("R.utils")
R.utils::bunzip2("StormData.csv.bz2", "StormData.csv", remove = FALSE, skip = TRUE)
?unzip

download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2",
              ./data/stormData.bz2, method = curl)

unzip(./data/stormData.bz2, ./data/stormData.csv)