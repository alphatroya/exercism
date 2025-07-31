public enum TranslationError: Error {
    case notFound
}

public func translationOfCodon(_ codon: String) throws -> String {
    switch codon {
    case "AUG":
        return "Methionine"
    case "UUU", "UUC":
        return "Phenylalanine"
    case "UUA", "UUG":
        return "Leucine"
    case "UCU", "UCC", "UCA", "UCG":
        return "Serine"
    case "UAU", "UAC":
        return "Tyrosine"
    case "UGU", "UGC":
        return "Cysteine"
    case "UGG":
        return "Tryptophan"
    case "UAA", "UAG", "UGA":
        return "STOP"
    default:
        throw TranslationError.notFound
    }
}

public func translationOfRNA(_ rna: String) throws -> [String] {
    Array(
        try stride(from: 0, to: rna.count, by: 3).map {
            let start = rna.index(rna.startIndex, offsetBy: $0)
            let end = rna.index(start, offsetBy: 3, limitedBy: rna.endIndex) ?? rna.endIndex
            return String(rna[start ..< end])
        }
        .map { try translationOfCodon($0) }
        .prefix(while: { $0 != "STOP" })
    )
}
