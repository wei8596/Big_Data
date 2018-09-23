import scala.util.control._

object Recursion {
	def main() {
		val br = new Breaks
		br.breakable {
			while(true) {
				print("Check number :")
				var num = scala.io.StdIn.readInt()
				println(num)
				if(num == 0) {
					br.break;
				}
				if(isPrime(num)) {
					println(num + " is a prime.")
				}
				else {
					println(num + " is not a prime.")
				}
			}
		}
	}
	def checkPrime(n: BigInt, div: BigInt): Boolean = {
		if(div*div > n) return true
		if(n%div == 0) return false
		return checkPrime(n, div+2)
	}
	def isPrime(n: BigInt): Boolean = {
		if(n==1 || n==2) return true
		if(n<1 || n%2==0) return false
		return checkPrime(n, 3)
	}
}
