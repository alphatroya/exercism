import Foundation

enum SumOfMultiples {
    static func toLimit(_ limit: Int, inMultiples multiples: [Int]) -> Int {
        return multiples.reduce(into: Set<Int>()) { result, multiple in
                (0...limit)
                    .map { $0 * multiple }
                    .filter { $0 < limit }
                    .forEach { result.insert($0) }
            }
            .reduce(0, +)
    }
}