library(ggplot2)
library(tidyverse)
library(ggthemes)

#load csv's and add variable for fail criterion 1&3
list <- read.csv("outcomes/blacklist.csv", strip.white = TRUE, stringsAsFactors = FALSE)
for (i in 1:nrow(list)) { if (list$Passes.Criterion.Tax.Transparancy[i] == "no"|list$Passes.Criterion.Anti.Beps[i] == "no")
{list$failfairbeps[i] <- "yes"
  } else {list$failfairbeps[i] <- "no"}
  
}

data <- read.csv("outcomes/countrydatawb.csv", stringsAsFactors = FALSE, strip.white = TRUE)

data$jurisdiction <- trimws(data$jurisdiction)

#merge list and make factors for blacklisted and failfairbeps
list <- merge(list, data, by = "jurisdiction")
list <- list[!duplicated(list),]
list$blacklisted. <- as.factor(list$blacklisted.)
list$failfairbeps <- as.factor(list$failfairbeps)

#ggplot with y = population and x = GDP

jpeg(file = "plots/blacklistgdppop.jpeg", width = 800, height = 600)
ggplot(data = list) + geom_point(aes(x= log(GDP.in..Billions), y = log(population.in.millions), color = blacklisted., size = GDP.per.cap)) +
  theme_few() +
  labs(x = "GDP", y = "Population", title = "Blacklisted", color = "Listed", size = "GDP per capita")
dev.off()

jpeg(file = "plots/fairbepsgdppop.jpeg", width = 800, height = 600)

ggplot(data = list) + geom_point(aes(x= log(GDP.in..Billions), y = log(population.in.millions), color = failfairbeps, size = GDP.per.cap)) +
  theme_few() +
 
   labs(x = "GDP", y = "Population", title = "Listed on criterion 1 or 3", color = "Listed", size = "GDP per capita")
dev.off()

#GGPlot with y = gdp per cap and x = gdp

jpeg(file = "plots/blacklistgdpcap.jpeg", width = 800, height = 600)
ggplot(data = list) + geom_point(aes(x = log(GDP.per.cap), y = log(GDP.in..Billions), color = blacklisted., size = population.in.millions)) + 
  theme_few() +
  labs( x = "GDP per Capita", y = "GDP", title = "Blacklisted", size = "Population in millions")
dev.off()

jpeg(file = "plots/fairbepsgdpcap.jpeg", width = 800, height = 600)

ggplot(data = list) + geom_point(aes(x= log(GDP.per.cap), y = log(GDP.in..Billions), color = failfairbeps, size = population.in.millions)) + 
  theme_few() +
  labs( x = "GDP per Capita", y = "GDP", title = "listed on criteria 1 or 3", size = "Population in millions", color = "Listed on criterion 1 or 3")
dev.off()

#barplots

jpeg(file = "plots/barblacklist.jpeg", width = 800, height = 600)
ggplot(data = list) + geom_histogram(aes(x= log(GDP.in..Billions), 
                                         y = (..count..)/sum(..count..),fill = blacklisted.), bins = 5, na.omit(list))+
  labs(y = "percent", x = "GDP", title = "Blacklisted", fill = "Blacklisted") +
  theme_few()
dev.off()

jpeg(file = "plots/barfairbeps.jpeg", width = 800, height = 600)
ggplot(data = list) + geom_histogram(aes(x= log(GDP.in..Billions), 
                                         y = (..count..)/sum(..count..),fill = failfairbeps), bins = 5, na.omit(list))+
  labs(y = "percent", x = "GDP", title = "listed on criteria 1 or 3", fill = "Blacklisted") +
  theme_few()
dev.off()



