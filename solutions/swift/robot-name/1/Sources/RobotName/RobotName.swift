import Foundation

final class Robot {
    private(set) lazy var name: String = nameGenerator()

    func resetName() {
        name = nameGenerator()
    }

    private func nameGenerator() -> String {
        let alphabeticLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        var newName = ""
        for _ in 0 ... 1 {
            guard let character = alphabeticLetters.randomElement() else {
                continue
            }
            newName += String(character)
        }

        let numericLetters = "1234567890"
        for _ in 0 ... 2 {
            guard let character = numericLetters.randomElement() else {
                continue
            }
            newName += String(character)
        }
        return newName
    }
}
