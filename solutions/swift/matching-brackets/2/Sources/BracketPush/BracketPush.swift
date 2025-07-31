final class BracketPush {

    private struct Bracket: Equatable {
        enum Kind: Equatable {
            case brackets, braces, parentheses
        }

        let kind: Kind

        let isOpen: Bool

        private init(kind: Bracket.Kind, isOpen: Bool) {
            self.kind = kind
            self.isOpen = isOpen
        }

        init?(_ character: Character) {
            switch character {
            case "(", ")":
                self = Bracket(kind: .parentheses, isOpen: character == "(")
            case "{", "}":
                self = Bracket(kind: .braces, isOpen: character == "{")
            case "[", "]":
                self = Bracket(kind: .brackets, isOpen: character == "[")
            default:
                return nil
            }
        }
    }

    static func paired(text: String) -> Bool {
        var lastBrackets: [Bracket] = []
        for character in text {
            switch (Bracket(character), lastBrackets.last) {
            case let (bracket?, _) where bracket.isOpen:
                lastBrackets += [bracket]
            case let (next?, prev?) where next.kind == prev.kind && !next.isOpen && prev.isOpen:
                _ = lastBrackets.popLast()
            case let (bracket?, _) where !bracket.isOpen:
                return false
            default:
                break
            }
        }
        return lastBrackets.isEmpty
    }
}