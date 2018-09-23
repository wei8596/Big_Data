import org.apache.spark.sql.SQLContext

val sqlContext = new SQLContext(sc)
val table = sqlContext.read.format("csv").option("header","true").option("inferSchema","true").option("encoding","UTF-8").load("EPS.csv")
table.printSchema()

table.groupBy("產業別").count.show(30,false)

table.sort(desc("基本每股盈餘(元)")).show(30,false)

table.groupBy("產業別").avg("基本每股盈餘(元)").sort(desc("avg(基本每股盈餘(元))")).show(30,false)

println("若要投資我會選擇\"裕隆日產汽車股份有限公司\",因為此產業較穩定,且公司獲利不錯,加上對汽車方面較有興趣.")
