
# Answer to question #1 - Number of countries that match:
dim(matchedData)
## [1] 189  34

# Answer to question #2 - Sort the data frame in desscending order, then What is the 13th country in the resulting data frame:
arrange(matchedData, Rank)[13, 3]
## [1] "Spain"

# Answers to #3 - 3 What are the average GDP rankings for the "High income: OECD" and "High income: nonOECD" groups?
# High income: OECD
mean(subset(matchedData, Income.Group %in% "High income: OECD", select = c(Rank))$Rank)
## [1] 32.96667
# High income: nonOECD
mean(subset(matchedData, Income.Group %in% "High income: nonOECD", select = c(Rank))$Rank)
## [1] 91.91304

# Answer to question #4
ggplot(matchedData,aes(y = GDP.Value, x =Income.Group, fill=Income.Group)) + scale_y_log10()+ geom_point(pch = 21, size = 8) + theme(text = element_text(size=15), axis.text.x = element_text(angle=90, hjust=1))
# Answer to question #5
breaks <- quantile(matchedData$Rank,seq(0, 1, 0.2))
head(cut(matchedData$Rank, breaks = breaks))
## [1] (152,190]   (76.2,114]  (38.6,76.2] (114,152]   (1,38.6]    (1,38.6]   
## Levels: (1,38.6] (38.6,76.2] (76.2,114] (114,152] (152,190]
matchedData$quantile<-cut(matchedData$Rank,breaks=breaks)
table(matchedData$Income.Group, matchedData$quantile)
##                       
##                        (1,38.6] (38.6,76.2] (76.2,114] (114,152] (152,190]
##   High income: nonOECD        4           5          8         4         2
##   High income: OECD          17          10          1         1         0
##   Low income                  0           1          9        16        11
##   Lower middle income         5          13         11         9        16
##   Upper middle income        11           9          8         8         9

