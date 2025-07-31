final class Raindrops {
    let number: Int

    init(_ number: Int) {
        self.number = number
    }

    var sounds: String {
        var result = ""
        if number.isMultiple(of: 3) {
            result += "Pling"
        }
        if number.isMultiple(of: 5) {
            result += "Plang"
        }
        if number.isMultiple(of: 7) {
            result += "Plong"
        }
        return result.isEmpty ? "\(number)" : result
    }
}