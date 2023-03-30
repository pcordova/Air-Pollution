if(!dir.exists("Data")) {dir.create("Data")}

download.file("https://raw.githubusercontent.com/pcordova/Weather-Events/main/statesCoord.csv",
              "./Data/statesCoord.csv", method = "curl")

library(data.table)

stormData <- fread("./Data/stormData.csv.bz2",
                               select = c(7,8,23:28),
                               col.names = c("State",
                                             "Event",
                                             "Fatalities",
                                             "Injuries",
                                             "propDamage",
                                             "propUnits",
                                             "cropDamage",
                                             "cropUnits"))

states <- fread("./Data/statesCoord.csv",
                col.names = c("state","location","lat","lon"))

str(stormData)

cat(sum(is.na(stormData)))

unique(stormData$Fatalities)

unique(stormData$Injuries)


unique(stormData$State)







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



dang <- stormData[, .(Fatalities = sum(Fatalities),
                      Injuries = sum(Injuries),
                      propLoss = sum(propLoss),
                      cropLoss = sum(cropLoss)),
                      by = State
                  ]

