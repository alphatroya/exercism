final class BracketPush {

    enum BracketType {
        case brackets, braces, parentheses
    }

    static func paired(text: String) -> Bool {
        var lastBrackets: [BracketType] = []
        for character in text {
            switch (character, lastBrackets.last) {
            case ("(", _):
                lastBrackets += [.brackets]
            case ("{", _):
                lastBrackets += [.braces]
            case ("[", _):
                lastBrackets += [.parentheses]
            case (")", .brackets?), ("}", .braces?), ("]", .parentheses?):
                _ = lastBrackets.popLast()
            case (")", _), ("}", _), ("]", _):
                return false
            default:
                break
            }
        }
        return lastBrackets.isEmpty
    }
}