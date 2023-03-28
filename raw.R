if(!dir.exists("Data")) {dir.create("Data")}

download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2",
              "./Data/stormData.bz2", method = "curl")

library(data.table)

stormData <- fread("./Data/stormData.bz2",
                               select = c(7,8,23:28),
                               col.names = c("State",
                                             "Event",
                                             "Fatalities",
                                             "Injuries",
                                             "propDamage",
                                             "propUnits",
                                             "cropDamage",
                                             "cropUnits"))

str(stormData)

cat(sum(is.na(stormData)))

unique(stormData$Fatalities)

unique(stormData$Injuries)










cat(NROW(unique(stormData$Event)))

unique(stormData$propUnits)

unique(stormData$cropUnits)

aggregate(cbind(stormData$Fatalities, stormData$Injuries), list(stormData$Event), sum)



########################################################################
## include description and justification for any data transformations ##
########################################################################

## figure(s) must have descriptive captions

## which types of events (EVTYPE) are most harmful to population health?





## which types of events have the greatest economic consequences?





## 