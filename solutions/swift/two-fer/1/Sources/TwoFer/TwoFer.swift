final class TwoFer {
    static func twoFer(name: String? = nil) -> String {
        if let name = name {
            return "One for \(name), one for me."
        } else {
            return "One for you, one for me."
        }
    }
}
