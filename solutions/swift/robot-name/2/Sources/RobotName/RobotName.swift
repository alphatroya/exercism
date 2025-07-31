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

        for _ in 0 ... 2 {
            let character = Int.random(in: 0...9) 
            newName += String(character)
        }
        return newName
    }
}
