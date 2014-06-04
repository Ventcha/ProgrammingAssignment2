# Summary
##Pair of functions for Coursera R Programming course: Assignment 2
## Created by: Ventcha
## Created on 3rd Jun 2014
## Version: 0.1

# Purpose
## These functions support a simple caching mechanism for matrix inversion calculations, .
## allowing a degree of performance improvements where the inverse of a given matrix is required multiple times
## in the course of a program/ function/ script.
## The matrixes supplied are assumed to be invertible, n x n matrix - no error checking is provided.

## Usage example: 
### newM1 = matrix(c(1,2,3,4),2,2)    create a matrix
### x = makeCacheMatrix(newM1)   effectively instantiate a cached-inverse matrix from the original
###  a1 = cacheSolve(x)     determine the Inverse of the matrix 
###  a2 = cacheSolve(x)     which, if repeated, would cause the CACHED value to be returned, rather than solving the inverse again

# Function makeCacheMatrix
## input: a matrix, assumed to be an invertible n x n matrix <NOT checked in the code>
## NOTE: for those of a more OO background, this essentially is acting like a sub-class of Matrix:
## Usage example: 
### newM1 = matrix(c(1,2,3,4),2,2)
### x = makeCacheMatrix(newM1)
## the invocation takes a matrix (as in a constructor of a class) and the resultant, 
## x, now has 4 methods available (2 get/set pairs).
## on creation there is an underlying copy of the data (matrix) and Inverse, cached via the usage of <<-
## the get methods return this data to the 'caller' and the set methods update the cache data. 
##Note: The INVERSE data is dependent upon the matrix itself, so setting a new matrix via 'set' 
##  is also seen to nullify any existing Inverse.
makeCacheMatrix <- function( theMatrix = matrix()) {
    mInverse <<- NULL
    ## update the cached matrix data with the new matrix AND reset the inverse (as this won't have been calculated)
    set <- function(newMatrix) {
      theMatrix <<- newMatrix
      mInverse <<- NULL
    }
    ## return the matrix data
    get <- function() theMatrix
    ## set the cached inverse matrix from new input data, for this matrix instantiation
    setInverse <- function(newInverse) mInverse <<- newInverse
    ## return the value of the cacehd inverse (which may be NULL)
    getInverse <- function() mInverse
    ## assign the functions to a list, which is then the 'return'
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)  
}


# Function cacheSolve
## input: a matrix, of 'type' makeCacheMatrix
## The function will attempt to retrieve the inverse from the 'matrix' and will use this if present (not NULL)
## Where no cached inverse exists, solve() will be called on the cached-matrix data, 
## and the result will be both set back to the cached-matrix AND returned to the caller

## Usage example: 
### newM1 = matrix(c(1,2,3,4),2,2)
### x = makeCacheMatrix(newM1)
## the invocation takes a matrix (as in a constructor of a class) and the resultant, 
cacheSolve <- function(x, ...) {
  # try and get the inverse matrix from the cached-matrix
  m <- x$getInverse()
  # check if it is not null - if so, then assume this is the correct inverse, and return it.
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  #inverse was null, so go through steps to calculate it
  data <- x$get()
  # Perform the inversion calculation using the std solve() method. Note no error handling
  m <- solve(data, ...)
  ## Updated the cached-matrix inverse - otherwise a subsequent call will repeat the Solve()
  x$setInverse(m)
  ## Return a matrix that is the inverse of 'x'
  m
}
