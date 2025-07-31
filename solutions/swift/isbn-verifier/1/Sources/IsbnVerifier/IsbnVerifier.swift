enum IsbnVerifier {
    static func isValid(_ code: String) -> Bool {
        var sum = 0
        var index = 1
        for character in code.lowercased().reversed().filter({ $0 != "-" }) {
            let number: Int
            if index == 1, character == "x" {
                number = 10
            } else if let int = Int(String(character)) {
                number = int
            } else {
                return false
            }
            sum += number * index
            index += 1
        }

        return (index - 1) == 10 && sum.isMultiple(of: 11)
    }
}
