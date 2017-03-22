gdpData <- gdpData[, c(1, 2, 4, 5)]
colnames(gdpData) <- c("CountryCode", "Rank", "Country.Name", "GDP.Value")
gdpData$GDP.Value <- as.numeric(gsub(",", "", gdpData$GDP.Value))
matchedData <- merge(gdpData, eduData, by.x = "CountryCode", by.y = "CountryCode")
