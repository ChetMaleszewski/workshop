#install and load
install.packages('dplyr')
library('dplyr')

glimpse(gapminder)

# select: pull subsets of columns from a dateframe
select(gapminder,year)
select(gapminder,year,lifeExp,country)
select(gapminder,-year)
# filter: select but for rows
filter(gapminder, continent == 'Asia')
filter(gapminder, continent != 'Oceania')
filter(gapminder, year > 2000)

two_countries<-c('Albania','Dominican Republic')
filter(gapminder,country %in% two_countries)
# piping
min(gapminder[,'lifeExp'])
#command shift m gives the pipe operator  %>% (windows ctrl shift m)
gapminder %>% select(lifeExp) %>% min()

x1=1:5
x2=2:6
(x1-x2)^2 %>% sum() %>% sqrt()

gapminder %>% select(-pop,-gdpPercap) %>% filter(continent == "Asia",year==2007) %>% 
  head()

# mutate : creates new columns
mean_world
gapminder %>% mutate(NewColumn = lifeExp-mean_world) %>% head()
#adding a column for differenc between current and mean expectancy
gapminder2<-gapminder %>% mutate(NewColumn = lifeExp-mean_world) %>% head()
glimpse(gapminder2)
gapminder2<-select(gapminder2,-NewColumn) #remove the column

#Exercise: Write a single command (which can span multiple lines and includes pipes) 
#that will produce a dataframe that has the African values for lifeExp, country and year, 
#but not for other Continents. How many rows does your dataframe have and why?
africa<-gapminder %>% filter(continent=="Africa") %>% select(lifeExp,country,year)

# group_by groups data set by unique values in certain column
gapminder %>% group_by(continent)

# summarize compound to specific calculation you want
#mean lifeExp by continent
gapminder %>% group_by(continent) %>% summarize(MeanLife=mean(lifeExp))
#mean lifeExp by continent and year
gapminder %>% group_by(continent,year) %>% summarize(MeanLife=mean(lifeExp))
#add standard error = std deviation/sqrt(n)
gapminder %>% group_by(continent,year) %>% summarize(MeanLife=mean(lifeExp),
                                                     SeLife=sd(lifeExp)/sqrt(n()))
#let's plot it!
gapminder %>% group_by(continent,year) %>% summarize(MeanLife=mean(lifeExp),
                                                     SeLife=sd(lifeExp)/sqrt(n())) %>% 
ggplot(mapping=aes(x=year,y=MeanLife,color=continent))+geom_line()+
  geom_errorbar(mapping=aes(ymin=MeanLife-SeLife,ymax=MeanLife+SeLife),width=0.3)


#Exercise count number of countries in each continent in gapminder
gapminder %>% select(country,continent) %>% unique() %>% 
  group_by(continent) %>% summarize(Count=n())

#give proportion of countries in each continent
gapminder %>% select(country,continent) %>% unique() %>% 
  group_by(continent) %>% summarize(n=n()) %>% mutate(count=sum(n),
                                                      proportion=n/count)
#Exercise:Create a new dataframe that contains the minimum (MinExp) 
#and maximum (MaxExp) life expectancies for each country. 
answer<-data.frame( gapminder %>% select(country,year,lifeExp) %>% group_by(country) %>% 
  summarize(MinLE=min(lifeExp),MaxLE=max(lifeExp)) )

#Challenge 3:Calculate the average life expectancy per country. 
#Which has the longest average life expectancy and which has the 
#shortest average life expectancy?
gapminder %>% select(country,year,lifeExp) %>% group_by(country) %>% 
                      summarize(AvgLE=mean(lifeExp)) %>% filter(AvgLE == min(AvgLE) | AvgLE == max(AvgLE))



#Final Exercise
#Make a ggplot scatterplot of the lifeExp vs GDPperCap for the countries whose average life expectancy is 
#lower than average for all years combined. Color the graph by continent

#average for all years combined is mean_lifeExp_gapminder from notes, I used mean_world

gapminder %>% select(country,lifeExp,gdpPercap,continent) %>% group_by(country) %>% 
  summarize(AvgLE=mean(lifeExp),AvgGDP=mean(gdpPercap),Con=unique(continent)) %>% filter(AvgLE<mean_world) %>% 
  ggplot(mapping=aes(x=AvgGDP,y=AvgLE,color=Con))+geom_point()
