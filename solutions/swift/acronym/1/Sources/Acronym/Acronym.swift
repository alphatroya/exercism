func abbreviate(_ phrase: String) -> String {
    var previous: Character?

    return phrase.filter { current in
        defer {
            previous = current
        }
        switch previous {
        case nil:
            return current.isUppercase
        case " ", "-":
            return true
        case let .some(character):
            return !character.isUppercase && current.isUppercase
        }
    }
    .uppercased()
}
