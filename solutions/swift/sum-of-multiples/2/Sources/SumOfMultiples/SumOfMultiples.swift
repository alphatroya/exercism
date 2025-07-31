import Foundation

func toLimit(_ limit: Int, inMultiples multiples: [Int]) -> Int {
    guard limit > 0 else {
        return 0
    }
    return (1 ..< limit)
        .map { number in
            for multiple in multiples {
                if number.isMultiple(of: multiple) {
                    return number
                }
            }
            return 0
        }
        .reduce(0, +)
}
