val rdd_in = sc.textFile("test.txt")
val rdd_strlist = rdd_in.flatMap(line=>line.split(" "))
val rdd_numlist = rdd_strlist.map(_.toInt)

println("Min : " + rdd_numlist.min)
println("Max : " + rdd_numlist.max)
println("Mean : " + rdd_numlist.mean)
println("Sum : " + rdd_numlist.sum)
println("Variance : " + rdd_numlist.variance)
println("Standard Deviation : " + rdd_numlist.stdev)
val asc_sort = rdd_numlist.sortBy(x=>x, true)
println("Ascending Order :")
asc_sort.collect
val des_sort = rdd_numlist.sortBy(x=>x, false)
println("Descending Order :")
des_sort.collect
