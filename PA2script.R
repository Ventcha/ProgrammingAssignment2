#Examples for Assignment 2: Matrix Inversion
setwd("~/Documents/coursera/R course/ProgrammingAssignment2")
source("cacheMatrix.R")
newM1 = matrix(c(1,2,3,4),2,2)
newM1
x = makeCacheMatrix(newM1)
a1 = cacheSolve(x)
a1
newM2 = matrix(c(1,3,2,4),2,2)
newM2
y = makeCacheMatrix(newM2)
a2 = cacheSolve(y)
a2
zz = newM1 * a1 #simple multiplication
zz
newM2 %*% a2 #proper Matrix multiplication
a3 = cacheSolve(x)
a3
