#Examples for Assignment 2: Matrix Inversion
setwd("~/Documents/coursera/R course/ProgrammingAssignment2")
source("cacheMatrix.R")
#correct matrix, new usage
newM1 = matrix(c(1,2,3,4),2,2)
newM1
x = makeCacheMatrix(newM1)
a1 = cacheSolve(x)
a1
# second correct matrix, first inverse
newM2 = matrix(c(1,3,2,4),2,2)
newM2
y = makeCacheMatrix(newM2)
a2 = cacheSolve(y)
a2
# checking results
zz = newM1 * a1 #simple multiplication
zz
newM2 %*% a2 #proper Matrix multiplication
### this results in the identity matrix

# repeat invocation on a cachematrix already inverted...
a11 = cacheSolve(x)
a11
#message produced stating used cache for the inverse

##################
# Failure examples
##################
# simply try cacheSolve on a matrix
newM3 = matrix(c(1,3,2,4),2,2)
a3 = cacheSolve(newM3)
# matrix is NOT n x n
newM4 = matrix(c(1,4,2,5,3,6),2,3)
z = makeCacheMatrix(newM4)
a4 = cacheSolve(z)


