import Foundation

enum GrainsError: Error {
    case inputTooHigh(String)
    case inputTooLow(String)
}

private let minRange = 1
private let maxRange = 64
private let errorMessageGenerator: (Int) -> String = {
    return "Input[\($0)] invalid. Input should be between \(minRange) and \(maxRange) (inclusive)"
}

func square(_ number: Int) throws -> UInt64 {
    switch number {
    case ..<minRange:
        throw GrainsError.inputTooLow(errorMessageGenerator(number))
    case (maxRange + 1)...:
        throw GrainsError.inputTooHigh(errorMessageGenerator(number))
    default:
        return UInt64(pow(2.0, Double(number - 1)))
    }
}

var total: UInt64 {
    return (minRange...maxRange)
        .map { try? square($0) }
        .compactMap { $0 }
        .reduce(0, +)
}
