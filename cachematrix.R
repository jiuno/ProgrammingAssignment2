## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
	cache <- NULL
	set<- function(y){
		cache <<- NULL
		x <<- y
	}
	get <- function() {
		x
	}
	setinverse <- function(inverse) {
		cache <<- inverse
	}
	getinverse <- function(){
		cache
	}
	list(       set = set, 
	            get = get,
	     setinverse = setinverse,
	     getinverse = getinverse
	     )
}
a<-makeCacheMatrix(x = matrix(c(4,1,3,1),nrow = 2,ncol = 2))
a$get()

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	cache <- x$getinverse()
	if(!is.null(cache)) {
		message("getting cached data")
		return(cache)
	}
	data <- x$get()
	cache <- solve(data, ...)
	x$setinverse(cache)
	cache
}
cacheSolve(a)
