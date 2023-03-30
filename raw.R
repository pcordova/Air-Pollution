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


mapdata$Fatalities <- as.integer(mapdata$Fatalities)




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
ggplot() +
    geom_polygon(data=fifty_states, aes(x=long, y=lat, group = group),color="white", fill="grey92" ) + 
  geom_point(data=mapdata, aes(x=lon, y=lat, size = Fatalities), color="blue") + 
  scale_size(name="", range = c(2, 20)) + 
  guides(size=guide_legend("Fatalities 1950-2011")) +
  theme_void()

ggplot(mapdata, aes(map_id = tolower(mapdata$location))) +
    geom_map(aes(fill = Fatalities), map = fifty_states) + 
  expand_limits(x = fifty_states$long, y = fifty_states$lat) +
  coord_map() +
  scale_x_continuous(breaks = NULL) + 
  scale_y_continuous(breaks = NULL) +
  labs(x = "", y = "") +
  theme(legend.position = "bottom", 
        panel.background = element_blank())



 +
  coord_map() +
 +
   +
  theme(legend.position = "bottom", 
        panel.background = element_blank())


p <- ggplot(mapdata, aes(map_id = location)) + 
     geom_map(aes(fill = Fatalities), map = fifty_states) + 
     expand_limits(x = fifty_states$long, y = fifty_states$lat) +
     coord_map() +
     scale_x_continuous(breaks = NULL) + 
     scale_y_continuous(breaks = NULL) +
     labs(x = "", y = "") +
     theme(legend.position = "bottom", 
          panel.background = element_blank())
p

mapdata <- as.data.frame(mapdata)
cla


