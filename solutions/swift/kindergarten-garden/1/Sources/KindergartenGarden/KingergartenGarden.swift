public struct Garden {
    public enum Plant: Character {
        case radishes = "R"
        case clover = "C"
        case grass = "G"
        case violets = "V"
    }

    let children: [String]
    let rows: String

    public init(_ rows: String, children: [String] = [
        "Alice",
        "Bob",
        "Charlie",
        "David",
        "Eve",
        "Fred",
        "Ginny",
        "Harriet",
        "Ileana",
        "Joseph",
        "Kincaid",
        "Larry",
    ]) {
        self.rows = rows
        self.children = children.sorted()
    }

    public func plantsForChild(_ child: String) -> [Plant] {
        let rows = self.rows.split(separator: "\n")
        guard rows.count == 2,
            let firstRow = rows.first,
            let lastRow = rows.last,
            firstRow.count == lastRow.count,
            let index = children.firstIndex(of: child) else {
            return []
        }

        var firstIndex = firstRow.index(firstRow.startIndex, offsetBy: 2 * index)
        var secondIndex = firstRow.index(firstRow.startIndex, offsetBy: 2 * index + 1)
        guard let firstPlant = Plant(rawValue: firstRow[firstIndex]),
            let secondPlant = Plant(rawValue: firstRow[secondIndex]) else {
            return []
        }

        firstIndex = lastRow.index(lastRow.startIndex, offsetBy: 2 * index)
        secondIndex = lastRow.index(lastRow.startIndex, offsetBy: 2 * index + 1)
        guard let thirdPlant = Plant(rawValue: lastRow[firstIndex]),
            let forthPlant = Plant(rawValue: lastRow[secondIndex]) else {
            return []
        }

        return [firstPlant, secondPlant, thirdPlant, forthPlant]
    }
}
