struct Board {
    let lines: [String]

    init(_ lines: [String]) throws {
        guard Set(lines.map { $0.count }).count == 1 else {
            throw BoardError.differentLength
        }
        for (index, line) in lines.enumerated() {
            try line.check(line: index, linesCount: lines.count)
        }
        self.lines = lines
    }

    func transform() -> [String] {
        var transformed = lines
        for (lineIndex, line) in lines.enumerated() {
            for (row, character) in line.enumerated() where character == Character.bombSymbol {
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
        return transformed
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

private extension Character {
    static let bombSymbol: Character = "*"
    static let space: Character = " "
    static let topBorder: Character = "-"
    static let sideBorder: Character = "|"
    static let angle: Character = "+"
}

extension String {
    func check(line: Int, linesCount: Int) throws {
        for (row, character) in enumerated() {
            switch (line, row) {
            case (0, _), (linesCount - 1, _):
                guard [Character.topBorder, Character.angle].contains(character) else {
                    throw Board.BoardError.faultyBorder
                }
            case (_, 0), (_, count - 1):
                guard character == Character.sideBorder else {
                    throw Board.BoardError.faultyBorder
                }
            default:
                guard [Character.space, Character.bombSymbol].contains(character) else {
                    throw Board.BoardError.invalidCharacter
                }
            }
        }
    }

    mutating func increment(_ row: Int) {
        guard row >= 0, row < indices.count else {
            return
        }

        var modifiedString = String()
        for (index, char) in enumerated() {
            if index == row,
                ![Character.bombSymbol, Character.sideBorder, Character.angle, Character.topBorder].contains(char) {
                let int = Int(String(char)) ?? 0
                modifiedString += "\(int + 1)"
            } else {
                modifiedString.append(char)
            }
        }

        self = modifiedString
    }
}
