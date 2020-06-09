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
	setmean <- function(inverse) {
		cache <<- inverse
	}
	getmean <- function(){
		cache
	}
	list(set = set, 
	     get = get,
	     setmean = setmean,
	     getmean = getmean
	     )
}
a<-makeCacheMatrix(x = matrix(1:12,nrow = 4,ncol = 3))
a$get()

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      

}
