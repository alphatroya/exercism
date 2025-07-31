import Foundation

func hey(_ input: String) -> String {
    let trimmed = input.trimmingCharacters(in: .whitespaces)
    guard !trimmed.isEmpty else {
        return "Fine. Be that way!"
    }

    var hasUppercase = false
    var hasLowercase = false
    for message_char in trimmed where !hasUppercase || !hasLowercase {
        hasUppercase = hasUppercase || message_char.isUppercase
        hasLowercase = hasLowercase || message_char.isLowercase
    }

    switch (trimmed.last, hasUppercase && !hasLowercase) {
    case (_, true):
        return "Whoa, chill out!"
    case ("?", false):
        return "Sure."
    case (_, false):
        return "Whatever."
    }
}