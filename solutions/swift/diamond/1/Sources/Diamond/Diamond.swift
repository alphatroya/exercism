import Foundation

func makeDiamond(letter: Character) -> [String] {
    guard letter.isLetter && letter.isUppercase,
          let currentScalarValue = Unicode.Scalar(String(letter))?.value,
          let aScalar = Unicode.Scalar("A")?.value else {
        return []
    }
    let spaceSymbol: Character = " "
    let capacity = currentScalarValue - aScalar + 1
    var result = [String]()
    for (index, element) in Array(aScalar...currentScalarValue).enumerated().reversed() {
        var line = Array<Character>(repeating:spaceSymbol, count: Int(capacity))
        line[index] = Unicode.Scalar(element).flatMap { Character($0) } ?? spaceSymbol
        result.append(String(line.reversed().dropLast() + line))
    }
    return result.reversed().dropLast() + result
}