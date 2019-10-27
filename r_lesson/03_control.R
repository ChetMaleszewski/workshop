#Control Flow: Loops and Conditionals

#For loops

for(my_var in 1:10){
  print(my_var)
}

for(planet in c('earth','mars','venus') ){
  print(planet)
}

#nested loops
for (i in 1:3){
  for (j in letters[1:3]){
    print(paste(i,j))
  }
}

#concatenate to vector in a loop  c <- c(c,thing to append)

#Using for loops on data
for(cont in unique(gapminder$continent)){
  min_life <- min(gapminder[gapminder$continent==cont,'lifeExp'])
  max_life <- max(gapminder[gapminder$continent==cont,'lifeExp'])
  mean_life<- mean(gapminder[gapminder$continent==cont,'lifeExp']) 
  print(paste(cont,'has a life expentancy between',min_life,'and',max_life))
  print(paste(cont, 'has a mean life expectancy of',mean_life))
}

#Conditional Statements if
x<--5
if(x>0){
  print('positive number')
}

#if,else
if(x>0){
  print('positive number')
} else if(x<0){
  print('not a positive number')
} else{
  print('equals zero')
}

#combining For and IfElse
for(x in c(-5,-3,0,1,5)){
  if(x > 0) {
    print(paste(x,'Positive number'))
  } else if (x < 0) {
    print(paste(x,'Negative number'))
  } else {
    print(paste(x,'Zero'))
  }
}

#using loops with data sets
#find which continents have a mean lifeExp above the world's mean lifeExp
mean_world=mean(gapminder$lifeExp)
print(mean_world)
for(cont in unique(gapminder$continent)){
  mean_life<- mean(gapminder[gapminder$continent==cont,'lifeExp']) 
  if (mean_life>mean_world)
    print(paste(cont,'has a lifeExp larger than the world mean lifeExp'))
}

# Exercise 
# For 2007
# Find which countries have a gdp at or below the 1st quartile
# and which countries have a gdp at or above the 3rd quartile
# and which  countries have a median gdp

sgdp=summary(gapminder[gapminder$year==2007,'gdpPercap'])
q1=sgdp[2]
gdpmed=sgdp[3]
q3=sgdp[5]
for(cry in unique(gapminder$country)){
  gdp2007=gapminder[gapminder$country==cry & gapminder$year==2007,'gdpPercap']
  if (gdp2007<=q1){
    print(paste(cry,'is at or below 1st quartile gdp'))
  }
  if(gdp2007>=q3){
    print(paste(cry,'is at or above 3rd quartile gdp'))
  }
  if(gdp2007==gdpmed)
    print(paste(cry, 'has the median gdp'))
}