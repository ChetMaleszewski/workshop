#Can install packages similar to Python.
install.packages('ggplot2')

#load the package
library(ggplot2)

#dataframe
#variables
#visualization

#load csv again
gapminder <-read.csv('gapminder.csv',stringsAsFactors = TRUE)

#plotting syntax, geom_point() says make it a scatter plot _line make a line plot
#ggplot() loads the data
ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp)) +geom_point()

ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, by=country, color=continent)) +
  geom_line()

# We can combine two forms of visualization
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, by=country, color=continent)) +
  geom_line() + geom_point()

# We can be selective about additional arguments based on type of visualization
levyr=ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, by=country)) +
  geom_line(mapping = aes(color=continent)) + geom_point()

#saving a plot
ggsave('lifeExp_vs_year.png',levyr)

#Let's fit a function to gdp data, first scale the x-axis to log
ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp)) +geom_point() + 
  scale_x_log10()

#geom_smooth() fits the default function
ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp)) +geom_point() + 
  scale_x_log10() + geom_smooth()

#can change fitting algorithm with method
ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp,color=continent)) +
  geom_point(aes(shape=continent)) + 
  scale_x_log10() + geom_smooth(method=loess)

#create a density plot of GDP per capita
ggplot(data=gapminder,mapping=aes(x=gdpPercap, color=continent)) +
         geom_density()+facet_wrap(~ continent)

#facet_wrap create subplots as a function of some column in your data frame

