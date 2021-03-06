## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverseVal) inv <<- inverseVal
  getInverse <- function() inv
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed), then cacheSolve
## will retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  inverseVal <- x$getInverse()
  if(!is.null(inverseVal)) {
    message("getting cached data")
    return(inverseVal)
  }
  matrixdata <- x$get()
  inverseVal <- solve(matrixdata, ...)
  x$setInverse(inverseVal)
  inverseVal
}
