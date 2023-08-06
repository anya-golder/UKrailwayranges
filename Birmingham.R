#load packages
library(ggplot2)
library(tidyverse)
library(conflicted)
library(maps)
library(sf)
library(classInt)
library(viridis)

#Import station coordinate data
birmingham <- read.csv("Birmingham_v2.2.csv")

#Map of Great Britain and Ireland
ggplot() +geom_polygon(data=worldmap, aes(x=long, y=lat, group=group), fill = "#FFFFFF", color = "#000000") +
  coord_fixed(ratio = 1.3, xlim = c(-10, 3), ylim = c(50.3, 59)) + #resize map
  theme_void() + #remove grid background
  geom_point(data = birmingham, aes(x= as.numeric(Station.Longitude), y= as.numeric(Station.Latitude), color = "#FF0000", alpha = .7)) + #add points
  geom_point(data = birmingham, aes(x=as.numeric(Start.Longitude), y=as.numeric(Start.Latitude), color = "#000000"))
