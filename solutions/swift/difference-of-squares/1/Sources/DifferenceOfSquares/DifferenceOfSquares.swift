struct Squares {
    let num: Int
    init(_ num: Int) {
        self.num = num
    }

    var squareOfSum: Int {
        let square = (0 ... num).reduce(into: 0) { $0 += $1 }
        return square * square
    }

    var sumOfSquares: Int {
        return (0 ... num).map { $0 * $0 }.reduce(into: 0) { $0 += $1 }
    }

    var differenceOfSquares: Int {
        return squareOfSum - sumOfSquares
    }
}
