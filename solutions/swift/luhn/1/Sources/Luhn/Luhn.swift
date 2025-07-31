import Foundation

final class Luhn {
    private let code: String

    init(_ code: String) {
        self.code = code.filter { $0 != " " }
    }

    var isValid: Bool {
        guard code.count > 1 else {
            return false
        }

        let intCodes = code.map { Int(String($0)) }.compactMap { $0 }
        guard intCodes.count == code.count else {
            return false
        }

        return intCodes.reversed().enumerated().map { (index, value) in
                if !index.isMultiple(of: 2) {
                    var newValue = value * 2
                    if newValue > 9 {
                        newValue -= 9
                    }
                    return newValue
                }
                return value
            }
            .reduce(into: 0) { $0 += $1 }
            .isMultiple(of: 10)
    }
}