#Part I
my_apply <- function(Data, Margin, Func){
  FUN <- match.fun(Func)  #extract a function specified by name
  dl <- length(dim(Data)) #get the dimension
  d <- dim(Data)          #d is a vector that stores Data's each dimension
  ds <- seq_len(dl)       #generate a vector from 1 to dl
  if(Margin!=1 && Margin!=2)
    stop("Margin error")
  s.call <- ds[-Margin]   #if Margin=1, s.call=2
  s.ans <- ds[Margin]
  d.call <- d[-Margin]
  d.ans <- d[Margin]
  newData <- aperm(Data, c(s.call, s.ans))  #transposition
  ans <- vector("list", d.ans)
  for(i in 1L:d.ans){
    tmp <- forceAndCall(1, FUN, newData[, i])  #call a function with some arguments
    if(!is.null(tmp))
      ans[[i]] <- tmp
  }
  ans.list <- is.recursive(ans[[1L]])
  len.a <- if (ans.list) 
    d2
  else length(ans <- unlist(ans, recursive = FALSE))
  if(Func %in% c("range", "sort", "rev")) {
    array(ans, c(len.a%/%d.ans, d.ans))
  }
  else return(ans)
}

x <- cbind(3, c(4:1, 2:5))
x

#sum
col.sum <- my_apply(x, 2, "sum")
col.sum
row.sum <- my_apply(x, 1, "sum")
row.sum

#max
col.max <- my_apply(x, 2, "max")
col.max
row.max <- my_apply(x, 1, "max")
row.max

#min
col.min <- my_apply(x, 2, "min")
col.min
row.min <- my_apply(x, 1, "min")
row.min

#range
col.range <- my_apply(x, 2, "range")
col.range
row.range <- my_apply(x, 1, "range")
row.range

#mean
col.mean <- my_apply(x, 2, "mean")
col.mean
row.mean <- my_apply(x, 1, "mean")
row.mean

#median
col.median <- my_apply(x, 2, "median")
col.median
row.median <- my_apply(x, 1, "median")
row.median

#var
col.var <- my_apply(x, 2, "var")
col.var
row.var <- my_apply(x, 1, "var")
row.var

#sd
col.sd <- my_apply(x, 2, "sd")
col.sd
row.sd <- my_apply(x, 1, "sd")
row.sd

#sort
col.sort <- my_apply(x, 2, "sort")
col.sort
row.sort <- my_apply(x, 1, "sort")
row.sort

#rev
col.rev <- my_apply(x, 2, "rev")
col.rev
row.rev <- my_apply(x, 1, "rev")
row.rev

#prod
col.prod <- my_apply(x, 2, "prod")
col.prod
row.prod <- my_apply(x, 1, "prod")
row.prod


#Part II
#1
my_rand <- sort(runif(25))
my_rand
#2
my_matrix <- matrix(my_rand, nrow = 5, ncol = 5)
my_matrix
#3
write.table(my_matrix, "matrix.txt")
#4
read_matrix <- as.matrix(read.table("matrix.txt", header = T))
read_matrix
#5
for(i in 1:5) {
  margin <- sample(1:2, 1, rep=T)
  func <- sample(c("sum", "max", "min", "range", "mean", "median", "var", "sd", "sort", "rev", "prod"), 1, rep = T)
  print(paste0("my_apply(read_matrix, ", margin, ", ", func, ")"))
  print(my_apply(read_matrix, margin, func))
}
