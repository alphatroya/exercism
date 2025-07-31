extension Array where Element == String {
    func recite() -> String {
        guard !isEmpty else {
            return ""
        }
        var result = ""
        var copy = self
        for _ in self {
            if copy.count == 1, let first = self.first {
                return result + "And all for the want of a \(first)."
            }
            let first = copy[0]
            let second = copy[1]
            result += "For want of a \(first) the \(second) was lost.\n"
            copy = Array(copy.dropFirst())
        }
        return result
    }
}
