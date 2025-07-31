struct NumberClassifier {
    let number: Int

    enum Classification {
        case perfect, deficient, abundant
    }

    var classification: Classification {
        let sum = (1 ..< number)
            .filter { self.number.isMultiple(of: $0) }
            .reduce(0, +)
        switch sum {
        case number:
            return .perfect
        case ..<number:
            return .deficient
        default:
            return .abundant
        }
    }
}
