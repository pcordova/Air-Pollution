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



dang2 <- dang
for (i in nrow(dang):1) {
    if(!(dang$State[i] %in% states$state)) {dang2 <- dang2[-i,]}   
}


dang2 <- dang[State %in% states$state]
setorder(dang2,State)
setorder(states,state)







?aggregate
aggregate(cbind(stormData$Fatalities, stormData$Injuries)
list(stormData$Event), sum)



########################################################################
## include description and justification for any data transformations ##
########################################################################

## figure(s) must have descriptive captions

## which types of events (EVTYPE) are most harmful to population health?





## which types of events have the greatest economic consequences?





## 
if(!file.exists("./Data/tl_rd22_us_state.zip")) {
    download.file("https://www2.census.gov/geo/tiger/TIGER_RD18/LAYER/STATE/tl_rd22_us_state.zip",
                  "./Data/tl_rd22_us_state.zip", method = "curl")
}
unzip("./Data/tl_rd22_us_state.zip", exdir = "./Data")


dang <- stormData[, .(Fatalities = sum(Fatalities),
                      Injuries = sum(Injuries),
                      propLoss = sum(propLoss),
                      cropLoss = sum(cropLoss)),
                      by = State
                  ]

