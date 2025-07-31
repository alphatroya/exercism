import Foundation

enum GrainsError: Error {
    case inputTooHigh(String)
    case inputTooLow(String)
}

private let minRange = 1
private let maxRange = 64

private func errorDescription(for number: Int) -> String {
    return "Input[\(number)] invalid. Input should be between \(minRange) and \(maxRange) (inclusive)"
}

func square(_ number: Int) throws -> UInt64 {
    guard number >= minRange else {
        throw GrainsError.inputTooLow(errorDescription(for: number))
    }
    guard number <= maxRange else {
        throw GrainsError.inputTooHigh(errorDescription(for: number))
    }
    return UInt64(pow(2.0, Double(number - 1)))
}

let total = UInt64.max
