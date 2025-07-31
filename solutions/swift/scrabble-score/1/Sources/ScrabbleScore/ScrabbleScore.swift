import Foundation

struct Scrabble {
    let word: String?

    init(_ word: String?) {
        self.word = word
    }

    static func score(_ word: String?) -> Int {
        return Scrabble(word).score
    }

    var score: Int {
        guard let word = self.word else {
            return 0
        }
        return word.components(separatedBy: .whitespacesAndNewlines)
            .joined()
            .lowercased()
            .reduce(into: 0) { result, character in
                switch character {
                case "a", "e", "i", "o", "u", "l", "n", "r", "s", "t":
                    result += 1
                case "d", "g":
                    result += 2
                case "b", "c", "m", "p":
                    result += 3
                case "f", "h", "v", "w", "y":
                    result += 4
                case "k":
                    result += 5
                case "j", "x":
                    result += 8
                case "q", "z":
                    result += 10
                default:
                    break
                }
            }
    }
}
