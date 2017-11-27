library(wbstats)
library(countrycode)
library(ggplot2)

countries <- read.csv("data/list of EU countries.csv")
colnames(countries) <- "Countries"

countries$ISO <- countrycode(countries$Countries, "country.name", "iso2c")

population <- wb(country = countries$ISO, "SP.POP.TOTL", mrv = 1, gapfill = TRUE)
GDP <- wb(country = countries$ISO, "NY.GDP.MKTP.CD", mrv = 1, gapfill = TRUE)
GDPcap <- wb(country = countries$ISO, "NY.GDP.PCAP.CD", mrv = 1, gapfill = TRUE)

for (i in 1:nrow(countries)){
  if (any(grepl(countries$ISO[i], population$iso2c)) == TRUE) {
    countries$population[i] <- population$value[grep(countries$ISO[i],population$iso2c)] 
     } else {
    countries$population[i] <- "NA" 
      }
}

for (i in 1:nrow(countries)){
  if (any(grepl(countries$ISO[i], GDP$iso2c)) == TRUE){
    countries$gdp[i] <- GDP$value[grep(countries$ISO[i], GDP$iso2c)]
  } else {
    countries$gdp[i] <- "NA"
  }
}

for (i in 1:nrow(countries)){
  if (any(grepl(countries$ISO[i], GDPcap$iso2c)) == TRUE) {
    countries$GDPcap[i] <- GDPcap$value[grep(countries$ISO[i],GDPcap$iso2c)] 
  } else {
    countries$GDPcap[i] <- "NA" 
  }
}
countries$population <- round(as.numeric(countries$population)/1000000, digits = 4)
countries$gdp <- round(as.numeric((countries$gdp))/1000000000, digits = 4)
countries$GDPcap <- round(as.numeric(countries$GDPcap), digits = 2)
countries <- countries[,-2]

colnames(countries) <- c("jurisdiction", "population in millions", "GDP in $Billions", "GDP per cap")
write.csv(countries, file = "outcomes/EUcountrydatawb.csv", row.names = FALSE)
