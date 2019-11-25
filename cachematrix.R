## overall, the pair of functions take in a matrix and caches the inverse of it

## takes in a matrix and creates a place to cache the inverse
makeCacheMatrix <- function(x = matrix()) {

  m <- NULL
  set <- function(y) {
    x<<- y
    m <<- NULL
  }
  
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}



## creates the inverse matrix with the solve function

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- inv(data, ...)
  x$setinverse(m)
  m
}
