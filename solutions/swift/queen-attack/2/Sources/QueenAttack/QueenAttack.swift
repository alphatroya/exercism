struct Queens {
    let white: [Int]
    let black: [Int]
    private let boardSize = 7

    init(white: [Int] = [0, 3], black: [Int] = [7, 3]) throws {
        guard white.count == 2, black.count == 2 else {
            throw InitError.incorrectNumberOfCoordinates
        }

        let verifyClosure: (Int) -> Bool = { i in i >= 0 && i <= 8 }
        guard white.allSatisfy(verifyClosure), black.allSatisfy(verifyClosure) else {
            throw InitError.invalidCoordinates
        }

        guard white != black else {
            throw InitError.sameSpace
        }

        self.white = white
        self.black = black
    }

    var description: String {
        var components: [String] = []
        for row in 0...boardSize {
            for column in 0...boardSize {
                switch (row, column) {
                case (white[0], white[1]):
                    components.append("W")
                case (black[0], black[1]):
                    components.append("B")
                default:
                    components.append("_")
                }
                if column != boardSize {
                    components.append(" ")
                }
            }
            if row != boardSize {
                components.append("\n")
            }
        }
        return components.joined()
    }

    var canAttack: Bool {
        guard white[0] != black[0] && white[1] != black[1] else {
            return true
        }
        var topLeft = white
        var topRight = white
        var bottomLeft = white
        var bottomRight = white
        for _ in 0...boardSize {
            bottomLeft = [bottomLeft[0] - 1, bottomLeft[1] + 1]
            bottomRight = [bottomRight[0] + 1, bottomRight[1] + 1]
            topLeft = [topLeft[0] - 1, topLeft[1] - 1]
            topRight = [topRight[0] - 1, topRight[1] + 1]
            if bottomLeft == black || topLeft == black || topRight == black || bottomRight == black {
                return true
            }
        }
        return false
    }

    enum InitError: Error {
        case incorrectNumberOfCoordinates
        case invalidCoordinates
        case sameSpace
    }
}

