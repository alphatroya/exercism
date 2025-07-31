import Foundation

func toLimit(_ limit: Int, inMultiples multiples: [Int]) -> Int {
    guard limit > 0 else {
        return 0
    }
    return (1 ..< limit)
        .filter { number in
            multiples.contains(where: { number.isMultiple(of: $0) })
        }
        .reduce(0, +)
}
