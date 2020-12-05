library(readxl)
Players <- read_excel("C:/Users/Javier Villanueva/Desktop/Navarra/Semestre 1/Machine Learning/Players.xlsx")
View(Players)
library(lattice)
xyplot(Players$Stamina ~  Players$Reflexes, group=Position, data=Players)

xyplot(Players$Dribbling ~  Players$Diving, group=Position, data=Players)

xyplot(Players$`Ball control` ~  Players$Handling, group=Position, data=Players)

DF <- Players

DF$Ranking = NULL
DF$Name = NULL
DF$Age = NULL
DF$Nationality = NULL
DF$Overall = NULL
DF$Potential = NULL
DF$Club = NULL

View(DF)

Results <- kmeans(DF[,1:34], 2, nstart=20)
table(Players$Position, Results$cluster)

Players2 <- read_excel("C:/Users/Javier Villanueva/Desktop/Navarra/Semestre 1/Machine Learning/Players2.xlsx")
View(Players2)

xyplot(Players2$Jumping ~  Players2$Acceleration, group=Position, data=Players2)

DF2 <- Players2
DF2$Ranking = NULL
DF2$Name = NULL
DF2$Age = NULL
DF2$Nationality = NULL
DF2$Overall = NULL
DF2$Potential = NULL
DF2$Club = NULL

View(DF2)

Results2 <- kmeans(DF2[,1:34], 2, nstart=20)
table(Players2$Position, Results2$cluster)

Players2$cluster = Results2$cluster
View(Players2)

which(Players2$Position=="CB" & Players2$cluster =="1")

print(x=Players2$Name[410])
print(x=Players2$Nationality[410])
print(x=Players2$Club[410])

which(Players2$Position=="ST" & Players2$cluster =="2")

print(x=Players2$Name[584])
print(x=Players2$Nationality[584])
print(x=Players2$Club[584])
