## Put comments here that give an overall description of what your
## functions do.
## 
## Bruno Fernando Alliani
## 
## This comments are based on the explanation given by Leonard Greski in
## "Demystifying makeVector()" in the following link:
## 
## https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-breakingDownMakeVector.md
## 
##  The purpose of this functions is to create an R object which
##  can store a matrix and its inverse matrix inside the enviroment 
##  of the  R object created. 
##  It is a method for storing objects in memory for subsequent access to it.
##  It reduces computation time as the computer doesn´t need to calculate its
##  value everytime its needed because it can call it directly from the memory
##  or "cache".
## 
## Write a short comment describing this function
## 
## The first function creates an object called "makeCacheMatrix" which can
## store a given matrix and its inverse matrix inside this object enviroment. 
## It also creates a list with 4 functions (2 setters and 2 getters functions).
## It is important to note that this function does NOT calculate the
## inverse matrix. It only stores data.
makeCacheMatrix <- function(x = matrix()) {
	cache <- NULL
	set<- function(y){
		cache <<- NULL  # Here, this assigment operator "<<-" means that the
		x <<- y         # value "NULL" is given to the cache variable        
	}			    # on the parent enviroment, makeCacheMatrix´s
				    # enviroment.
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

## Write a short comment describing this function
## This function returns the inverse matrix of the one created inside the
## "makeCacheMatrix" enviroment and stores it inside makeCacheMatrix.
## If the inverse matrix has already been calculated, this function "caches" or 
## retrieves the inverse matrix calculated before.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	cache <- x$getinverse()
	if(!is.null(cache)) {
		message("getting cached data")
		return(cache)
	}
	data <- x$get()
	cache <- solve(data, ...)	# <- This line calculates the inverse matrix
	x$setinverse(cache)
	cache
}


