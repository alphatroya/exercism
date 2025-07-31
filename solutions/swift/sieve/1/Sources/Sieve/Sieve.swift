final class Sieve {
    let n: Int

    var primes: [Int] {
        var primes = Array(2 ... n)
        for index in 0 ..< n {
            if filter(&primes, by: index) {
                return primes
            }
        }
        return primes
    }

    init(_ n: Int) {
        self.n = n
    }

    private func filter(_ input: inout [Int], by index: Int) -> Bool {
        guard input.indices.contains(index) else {
            return true
        }
        let element = input[index]
        input = input.filter { !$0.isMultiple(of: element) || element == $0 }
        return false
    }
}
