//Solution goes in Sources

struct BeerSong {
    let numberOfBeerBottles: Int

    func generateVersesOfBeerSong() -> String {
        var result: [String] = []
        for i in (0...numberOfBeerBottles).reversed() {
            var verse: [String] = []

            switch i {
            case 1:
                verse.append("1 bottle of beer on the wall, 1 bottle of beer.")
            case 0:
                verse.append("No more bottles of beer on the wall, no more bottles of beer.")
            default:
                verse.append("\(i) bottles of beer on the wall, \(i) bottles of beer.")
            }

            let intro = "Take one down and pass it around, "
            switch i {
            case 2:
                verse.append("\(intro)\(i - 1) bottle of beer on the wall.")
            case 1:
                verse.append("\(intro)no more bottles of beer on the wall.")
            case 0:
                verse.append("Go to the store and buy some more, 99 bottles of beer on the wall.")
            default:
                verse.append("\(intro)\(i - 1) bottles of beer on the wall.")
            }
            result.append(verse.joined(separator: "\n"))
        }

        return result.joined(separator: "\n\n")
    }
}
