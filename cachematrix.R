## These functions will first

## makeCacheMatrix creates the matrix object and clears out previously cached
## value for m. It then builds a set of functions (namely set, get, setinv and
getinv) and returns to thr parent environment.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
    set <- function(y) {
      x <<- y
      m <<- NULL
    }
    get <- function() x
    setinv <- function(solve) m <<- solve
    getinv <- function() m
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}


## This function calls the inverse matrix object if it has been previously solved
## and cached. Otherwise, it solves the inverse,
## returns it and stores it in m.

cacheSolve <- function(x, ...) {
  m <- x$getinv()  ## Return a matrix that is the inverse of 'x'
  if(!is.null(m)) {
   message("getting cached data")
   return(m)
 }
 data <- x$get()
 m <- solve(data, ...)
 x$setinv(m)
 m
}
