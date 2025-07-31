final class Squares {
    let num: Int

    init(_ num: Int) {
        self.num = num
    }

    private(set) lazy var squareOfSum: Int = {
        let square = (1...num).reduce(into: 0) { $0 += $1 }
        return square * square
    }()

    private(set) lazy var sumOfSquares: Int = {
        return (1...num).map { $0 * $0 }.reduce(into: 0) { $0 += $1 }
    }()

    private(set) lazy var differenceOfSquares: Int = {
        return squareOfSum - sumOfSquares
    }()
}
