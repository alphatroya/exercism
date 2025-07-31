let plain = "abcdefghijklmnopqrstuvwxyz"
let cipher = String(plain.reversed())

func encode(_ phrase: String) -> String {
    phrase.lowercased()
        .filter { !$0.isWhitespace && !$0.isPunctuation }
        .map { char in
            plain.firstIndex(of: char)
                .flatMap { String(cipher[$0]) } ?? String(char)
        }
        .enumerated()
        .reduce(into: [String]()) { result, package in
            if package.offset > 0, package.offset.isMultiple(of: 5) {
                result += [" "]
            }
            result += [package.element]
        }
        .joined()
}
