## Load necessary packages
library(XLConnect)
library(dplyr)
library(ggplot2)

## Load data from excel file
games_df <- readWorksheetFromFile("gamedata.xlsx", sheet = 1)

str(games_df)
head(games_df, n = 10)
sum(is.na(games_df))

ggplot(data = games_df, aes(x = Score)) + geom_histogram(fill = "dark red")

summarise(games_df, avg=mean(Score))
kruskal.test(Score ~ Genre, data = games_df)
summary(aov(Score ~ Genre, data = games_df))
## Use dplyr to subset data frame
WiiU_df <- filter(games_df, Platform == "Wii U")
PS4_df <- filter(games_df, Platform == "PlayStation 4")
Xbox1_df <-filter(games_df, Platform == "Xbox One")

##Visualizations for game consoles. Bar plots
ggplot(data = Xbox1_df, aes(x = Score)) + geom_bar(colour = "black", fill = "Green") + ggtitle("Xbox One")
ggplot(data = WiiU_df, aes(x = Score)) + geom_bar(colour = "black", fill = "Yellow") + ggtitle("Wii U")
ggplot(data = PS4_df, aes(x = Score)) + geom_bar(colour = "black", fill = "blue") + ggtitle("PlayStation 4")

ggplot(data = Xbox1_df, aes(x = Score)) + geom_histogram(colour = "black", fill = "Green") + ggtitle("Xbox One")
ggplot(data = WiiU_df, aes(x = Score)) + geom_histogram(colour = "black", fill = "Yellow") + ggtitle("Wii U")
ggplot(data = PS4_df, aes(x = Score)) + geom_histogram(colour = "black", fill = "blue") + ggtitle("PlayStation 4")


## Scatterplots. Seeing correlation between game scores and genres

Xbox1_df %>% mutate(Genre = fct_infreq(Genre)) %>%
ggplot(Xbox1_df, aes(x = Score, y = Genre)) + geom_point() + ggtitle("Xbox One") 
ggplot(data = WiiU_df, aes(x = Score, y = Genre)) + geom_point() + ggtitle("Wii U")
ggplot(data = PS4_df, aes(x = Score, y = Genre)) + geom_point() + ggtitle("PlayStation 4")

