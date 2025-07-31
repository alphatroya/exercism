struct Board {
    var lines: [String] {
        return splitLines.map { $0.joined() }
    }

    let splitLines: [[String]]

    init(_ lines: [String]) throws {
        guard Set(lines.map { $0.count }).count == 1 else {
            throw BoardError.differentLength
        }
        let characters = lines.map { string in string.map { String($0) } }
        let count = characters.count
        for (index, line) in characters.enumerated() {
            try line.check(line: index, linesCount: count)
        }
        splitLines = characters
    }

    func transform() -> [String] {
        var transformed = splitLines
        for (lineIndex, line) in splitLines.enumerated() {
            for (row, character) in line.enumerated() where character == String.bombSymbol {
                if var previousLine = transformed[safe: lineIndex - 1] {
                    previousLine.increment(row - 1)
                    previousLine.increment(row)
                    previousLine.increment(row + 1)
                    transformed[lineIndex - 1] = previousLine
                }
                if var currentLine = transformed[safe: lineIndex] {
                    currentLine.increment(row - 1)
                    currentLine.increment(row + 1)
                    transformed[lineIndex] = currentLine
                }
                if var nextLine = transformed[safe: lineIndex + 1] {
                    nextLine.increment(row - 1)
                    nextLine.increment(row)
                    nextLine.increment(row + 1)
                    transformed[lineIndex + 1] = nextLine
                }
            }
        }
        return transformed.map { $0.joined() }
    }

    enum BoardError: Error {
        case differentLength, invalidCharacter, faultyBorder
    }
}

extension Array {
    subscript(safe safe: Int) -> Element? {
        guard safe >= 0, indices.contains(safe) else {
            return nil
        }
        return self[safe]
    }
}

private extension String {
    static let bombSymbol: String = "*"
    static let space: String = " "
    static let topBorder: String = "-"
    static let sideBorder: String = "|"
    static let angle: String = "+"
}

extension Array where Element == String {
    func check(line: Int, linesCount: Int) throws {
        for (row, character) in enumerated() {
            switch (line, row) {
            case (0, _), (linesCount - 1, _):
                guard [String.topBorder, String.angle].contains(character) else {
                    throw Board.BoardError.faultyBorder
                }
            case (_, 0), (_, count - 1):
                guard character == String.sideBorder else {
                    throw Board.BoardError.faultyBorder
                }
            default:
                guard [String.space, String.bombSymbol].contains(character) else {
                    throw Board.BoardError.invalidCharacter
                }
            }
        }
    }

    mutating func increment(_ row: Int) {
        guard row >= 0, indices.contains(row) else {
            return
        }
        let char = self[row]
        guard ![String.bombSymbol, String.sideBorder, String.angle, String.topBorder].contains(char) else {
            return
        }

        let int = Int(char) ?? 0
        self[row] = "\(int + 1)"
    }
}
