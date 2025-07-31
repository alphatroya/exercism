import Foundation

func hey(_ input: String) -> String {
    let trimmed = input.trimmingCharacters(in: .whitespaces)
    guard !trimmed.isEmpty else {
        return "Fine. Be that way!"
    }

    let isUppercase = trimmed.uppercased() == trimmed
    let isLowercase = trimmed.lowercased() == trimmed

    switch (trimmed.last, isUppercase && !isLowercase) {
    case (_, true):
        return "Whoa, chill out!"
    case ("?", false):
        return "Sure."
    case (_, false):
        return "Whatever."
    }
}
