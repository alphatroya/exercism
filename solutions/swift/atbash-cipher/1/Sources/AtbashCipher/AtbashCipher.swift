import Foundation

let plain = "abcdefghijklmnopqrstuvwxyz"
let cipher = String(plain.reversed())

func encode(_ phrase: String) -> String {
    phrase.lowercased()
        .filter { !$0.isWhitespace && !$0.isPunctuation }
        .map { char -> String in
            plain.firstIndex(of: char)
                .flatMap { String(cipher[$0]) } ?? String(char)
        }
        .enumerated()
        .reduce(into: [String]()) { result, package in
            result += [package.element]
            if (package.offset + 1).isMultiple(of: 5) {
                result += [" "]
            }
        }
        .joined()
        .trimmingCharacters(in: .whitespaces)
}