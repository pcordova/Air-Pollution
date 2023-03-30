

################################################################################

ggplot(longdata, aes(map_id = location)) +
  # map points to the fifty_states shape data
  geom_map(aes(fill = fatalities), map = fifty_states) + 
  expand_limits(x = fifty_states$long, y = fifty_states$lat) +
  coord_map() +
  scale_x_continuous(breaks = NULL) + 
  scale_y_continuous(breaks = NULL) +
  labs(x = "", y = "") +
  theme(legend.position = "right") +
  facet_wrap( ~ effect, dir = "h")

################################################################################



longdata <- rbind(cbind(effect = "Fatalities", mapdata[,location,fatalities]),
                  cbind(effect = "Injuries", mapdata[,location,injuries]),
                #  cbind(effect = "Property Loss", mapdata[,location,propLoss]),
                 # cbind(effect = "Crop Loss", mapdata[,location,cropLoss]),
                  use.names=FALSE)
                  

dang2 <- dang[State %in% states$state]
setorder(dang2,State)
setorder(states,state)


mapdata$Fatalities <- as.integer(mapdata$Fatalities)




?aggregate
aggregate(mapdata,cbind(stormData$Fatalities, stormData$Injuries)
list(stormData$Event), sum)



########################################################################
## include description and justification for any data transformations ##
########################################################################

## figure(s) must have descriptive captions

## which types of events (EVTYPE) are most harmful to population health?





## which types of events have the greatest economic consequences?





## 
ggplot() +
    geom_polygon(data=fifty_states, aes(x=long, y=lat, group = group),color="#DDEDF3", fill="#193B48" ) + 
  geom_point(data=mapdata, aes(x=lon, y=lat, size = fatalities), color="#337995") + 
  scale_size(name="", range = c(2, 20)) + 
  guides(size=guide_legend("Fatalities 1950-2011")) +
  theme_void()

ggplot(mapdata, aes(map_id = tolower(mapdata$location))) +
    geom_map(aes(fill = cropLoss), map = fifty_states) + 
  expand_limits(x = fifty_states$long, y = fifty_states$lat) +
  coord_map() +
  scale_x_continuous(breaks = NULL) + 
  scale_y_continuous(breaks = NULL) +
  labs(x = "", y = "") +
  theme(legend.position = "bottom", 
        panel.background = element_blank()) +
    fifty_states_inset_boxes()



 +
  coord_map() +
 +
   +
  theme(legend.position = "bottom", 
        panel.background = element_blank())


p <- ggplot(mapdata, aes(map_id = location)) + 
     geom_map(aes(fill = fatalities), map = fifty_states) + 
     expand_limits(x = fifty_states$long, y = fifty_states$lat) +
     coord_map() +
     scale_x_continuous(breaks = NULL) + 
     scale_y_continuous(breaks = NULL) +
     labs(x = "", y = "") +
     theme(legend.position = "bottom", 
          panel.background = element_blank())
p




