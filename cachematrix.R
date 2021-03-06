## Put comments here that give an overall description of what your
## functions do
## Write a short comment describing this function

# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
inv_x <- NULL
set <- function(y) {
x <<- y
inv_x <<- NULL
 }
get <- function() x
setinverse<- function(inverse) inv_x <<-inverse
getinverse <- function() inv_x
list(set = set, get = get,
setinverse = setinverse,
getinverse = getinverse)

}


## Write a short comment describing this function
# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.

# This function assumes that the matrix is always invertible.
cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
## Return a matrix that is the inverse of 'x'
inv_x <- x$getinverse()
if (!is.null(inv_x)) {
message("getting cached inverse matrix")
return(inv_x)
}
else
{
inv_x <- solve(x$get())
x$setinverse(inv_x)
return(inv_x)
}
}
## Sample run:
## > x = rbind(c(1, -1/4), c(-1/4, 1))
## > m = makeCacheMatrix(x)
## > m$get()
##       [,1]  [,2]
## [1,]  1.00 -0.25
## [2,] -0.25  1.00

## No cache in the first run
## > cacheSolve(m)
##           [,1]      [,2]
## [1,] 1.0666667 0.2666667
## [2,] 0.2666667 1.0666667

## Retrieving from the cache in the second run
## > cacheSolve(m)
## getting cached data.
##           [,1]      [,2]
## [1,] 1.0666667 0.2666667
## [2,] 0.2666667 1.0666667
