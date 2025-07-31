import Foundation

func isPangram(_ sentence: String) -> Bool {
    guard !sentence.isEmpty else {
        return false
    }

    var controlSet: Set<Character> = Set("abcdefghijklmnopqrstuvwxyz")
    for chars in sentence.filter({ $0.isASCII }).lowercased() {
        controlSet.remove(chars)
    }
    return controlSet.isEmpty
}