struct SimulatedRobot {
    enum Direction {
        case north, east, west, south
    }

    enum Instruction: Character {
        case advance = "A"
        case turnLeft = "L"
        case turnRight = "R"
    }

    private(set) var bearing: Direction = .north
    private(set) var coordinates: [Int] = [0, 0]

    mutating func orient(_ new: Direction) {
        bearing = new
    }

    mutating func at(x: Int, y: Int) {
        coordinates = [x, y]
    }

    mutating func advance() {
        switch bearing {
        case .north:
            coordinates[1] += 1
        case .west:
            coordinates[0] -= 1
        case .south:
            coordinates[1] -= 1
        case .east:
            coordinates[0] += 1
        }
    }

    mutating func turnLeft() {
        switch bearing {
        case .north:
            bearing = .west
        case .west:
            bearing = .south
        case .south:
            bearing = .east
        case .east:
            bearing = .north
        }
    }

    mutating func turnRight() {
        switch bearing {
        case .north:
            bearing = .east
        case .east:
            bearing = .south
        case .south:
            bearing = .west
        case .west:
            bearing = .north
        }
    }

    mutating func place(x: Int, y: Int, direction: Direction) {
        at(x: x, y: y)
        orient(direction)
    }

    mutating func evaluate(_ expression: String) {
        for instruction in instructions(expression) {
            switch instruction {
            case .advance:
                advance()
            case .turnRight:
                turnRight()
            case .turnLeft:
                turnLeft()
            }
        }
    }

    func instructions(_ string: String) -> [Instruction] {
        string.compactMap { Instruction(rawValue: $0) }
    }
}
