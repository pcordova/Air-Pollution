if(!dir.exists("Data")) {dir.create("Data")}

download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2",
              "./Data/stormData.bz2", method = "curl")

stormData <- data.table::fread("./Data/stormData.bz2")

