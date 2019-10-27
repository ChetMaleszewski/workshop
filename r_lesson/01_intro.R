#To run a specific line(s) in a R-script, place cursor or highlight lines and hit command+enter

3+2
4/2
2*(4+2)
#This is a comment line.

#Types of numbers in R and class function.
#Three types of data types, numeric (float), interger, complex
#any number by itself is numeric
#use class(#) to give you data type
#to make an integer add capital L to end of it or use as.integer()
class(3)
class(3L)
class(as.integer(3))
#complex numbers use a+bi structure
class(2+3i)

#Word types:string, character, logical
#put strings in quotes, it's a series of characters, 
#string is not a type,class will recognize string as character
#TRUE and FALSE are logical special case for use with conditionals, use all caps for logical
#otherwise it will be string.
class('dog')
class(TRUE)

#Use == for evaluation of logicals, = defines a variable as something
#define variable as name = value can also use operator assingment <-
#try to default to arrow as some R structures don't work with =
my_var = 'tucson'
dog <- 3
#Can only start variable names with letter or period
#Can use . or _ in middle for longer var names (no spaces!)
import.ant <- 'comfortable'

# Data structures availale in R
#Vector, single column array, can use : for numerics a la MATLAB for evently spaced
#use c() to define a vector if not numeric and evenly space
num_vector=1:10
logical_vector<-c(TRUE,FALSE,TRUE)
ch_vector<-c('dog','cat','mouse')
#Can't mix multiple data types in a vector

#Lists, structure that lets you use multiple data types
#list() to create a list
my_list=list(1,'A','TRUE')

#?function to get help on a fucntion
?matrix

#matrix, multiple rows and columns, single data type
m<-matrix(nrow=2,ncol=3) #how to define a matrix
#can insert data in matrix defn
m<-matrix(1:6,nrow=2,ncol=3)
#defaults to fill by column, to fill by row first add byrow=TRUE
m<-matrix(1:6,nrow=2,ncol=3,byrow=TRUE)

#DataFrame matrix that can hold multiple data types
#build column by column, give name of column and values
df<-data.frame(id=letters[1:10], x=1:10,y=11:20)
#class will give structure type
class(df)
#you can get sizes of structures with nrow() ncol() dim()
nrow(df)
ncol(df)
dim(df)

#display more details of structures using str or summar
str(df)
summary(df)

#rep (repeat a value a number of times)
rep(1,4) #gives 1 1 1 1
fact <- c(rep(1,4),rep(2,3), rep(3,5))

#more complicated data frame
cats<-data.frame(coat=c("calico","black","tabby"),
                 weight=c(2.1,5.0,3.2),
                 likes_string=c(1,0,1))
cats

#write dataframe to csv
write.csv(x=cats,file="cats_data.csv",row.names=FALSE)
#similar to read csv
cats2 <- read.csv(file='cats_data.csv')

#find current working directory in R script or console
getwd()

#use $ to get a specific column by column name
cats$coat
cats$weight
cats$weight+5 #can run same math operation on column this way, doesn't save

#use cbind() to add column to dataframe, use rbind to add row
age <-c(3,4,5)
cbind(cats,age)
rbind()

##Let's load the first data file we will use for later lessons in the workshop
gapminder <- read.csv(file="gapminder.csv")
str(gapminder)
nrow(gapminder)
ncol(gapminder)
dim(gapminder)
summary(gapminder)
#can use head and tail from unix in RStudio
head(gapminder)
tail(gapminder)
#get column names
colnames(gapminder)

#minimum, maximum and mean values for specific column
min(gapminder$year)
max(gapminder$lifeExp)
mean(gapminder$pop)

#getting a specific cell df[row#,col#] use a:b to get range or rows or cols
gapminder[1,1]
gapminder[1:5,6]

#use - sign to cut rows or columns, 
#ex: only print first two rows using -
gapminder[-3:-1704,]

#can use column names or vector of column names to specify sections of df you want
head(gapminder[,'lifeExp'])
head(gapminder[,c('lifeExp','pop')])

#find all rows with a value for a column at a certain value
gapminder[gapminder$year==1997,]
gapminder[gapminder$country=='Gabon',c(3,5)]
