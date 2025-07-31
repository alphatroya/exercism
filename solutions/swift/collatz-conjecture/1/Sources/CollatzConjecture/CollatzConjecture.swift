enum CollatzConjecture {
    enum CollatzConjectureError: Error {
        case wrongInput
    }
    static func steps(_ number: Int) throws -> Int {
        guard number > 0 else {
            throw CollatzConjectureError.wrongInput
        }
        var steps = 0
        var number = number
        while number != 1 {
            if number.isMultiple(of: 2) {
                number /= 2
            } else {
                number = (number * 3) + 1
            }
             steps += 1
        }
        return steps
    }
}