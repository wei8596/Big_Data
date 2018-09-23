import org.apache.spark.{SparkConf, SparkContext}
import org.apache.spark.mllib.stat.KernelDensity
import org.apache.spark.rdd.RDD

// an RDD of sample data
val data: RDD[Double] = sc.parallelize(Seq(1, 1, 1, 2, 3, 4, 5, 5, 6, 7, 8, 9, 9))

// Construct the density estimator with the sample data and a standard deviation
// for the Gaussian kernels
val kd = new KernelDensity().setSample(data).setBandwidth(3.0)

// Find density estimates for the given values
val densities = kd.estimate(Array(-1.0, 2.0, 5.0))

densities.foreach(println)
