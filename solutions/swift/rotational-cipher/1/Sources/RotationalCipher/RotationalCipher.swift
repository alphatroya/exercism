func rotate(_ input: String, ROT: UInt32) -> String {
    return input
        .map { String($0) }
        .compactMap { character -> String? in
            guard let scalar = Unicode.Scalar(character) else {
                return nil
            }
            switch scalar {
            case "A" ... "Z":
                return transform(rot: ROT, current: scalar.value, maxBound: "Z", minBound: "A")
                    .flatMap { String($0) }
            case "a" ... "z":
                return transform(rot: ROT, current: scalar.value, maxBound: "z", minBound: "a")
                    .flatMap { String($0) }
            default:
                return character
            }
        }
        .joined()
}

private func transform(rot: UInt32, current: UInt32, maxBound: String, minBound: String) -> Unicode.Scalar? {
    guard let maxScalarValue = Unicode.Scalar(maxBound)?.value,
        let minScalarValue = Unicode.Scalar(minBound)?.value else {
        return nil
    }
    let newScalarValue = current + rot
    if newScalarValue <= maxScalarValue {
        return Unicode.Scalar(newScalarValue)
    } else {
        return Unicode.Scalar(newScalarValue - (maxScalarValue - minScalarValue + 1))
    }
}
