## This pair of functions cache the inverse of a matrix.

## The first function creates a special "matrix" object (which is actually a list) 
## that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        i<-NULL ## set the default inverse to null
        set<-function(y){ ## caches the object and its inverse
                x<<-y
                i<<-NULL
        }
        get <-function() x ## returns the cached object
        setinverse<-function(solve) i<<-solve ## computes and stores the inverse
        getinverse<-function() i ## returns the cached inverse
        list(set=set,get=get,setinverse=setinverse,getinverse=getinverse) 
}


## The second function computes the inverse of the "matrix" returned by makeCacheMatrix.
## If the inverse has already been computed, the function instead simply returns the
## cached inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i<-x$getinverse()
        if(!is.null(i)){ ## if the inverse has already been computed, this returns it
                message("getting cached data")
                return(m)
        }
        data<-x$get() ## otherwise, this retrieves the matrix
        i<-solve(data,...) ## then computes its inverse
        x$setinverse(i) ## then stores it
        i ## and finally returns the inverse
}
