//Solution goes in Sources

struct BeerSong {
    let numberOfBeerBottles: Int

    func generateVersesOfBeerSong() -> String {
        var result: [String] = []
        for i in (0...numberOfBeerBottles).reversed() {
            var verse: [String] = ["\(bottlesString(for: i, capitalizeFirst: true)), \(bottlesString(for: i, onWall: false))."]
            switch i {
            case 0:
                verse.append("Go to the store and buy some more, \(bottlesString(for: 99)).")
            default:
                verse.append("Take one down and pass it around, \(bottlesString(for: i - 1)).")
            }
            result.append(verse.joined(separator: "\n"))
        }

        return result.joined(separator: "\n\n")
    }

    private func bottlesString(for count: Int, capitalizeFirst: Bool = false, onWall: Bool = true) -> String {
        var result: String
        if count == 0 {
            result = "\(capitalizeFirst ? "N" : "n")o more bottles of beer"
        } else {
            result = "\(count) bottle\(count > 1 ? "s" : "") of beer"
        }
        return onWall ? result + " on the wall" : result
    }
}
