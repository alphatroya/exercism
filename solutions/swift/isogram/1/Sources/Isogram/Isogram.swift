func isIsogram(_ input: String) -> Bool {
    let onlyLetters = input.lowercased().filter { $0 != " " && $0 != "-" }
    let onlyLettersSet = Set(onlyLetters)
    return onlyLetters.count == onlyLettersSet.count
}
