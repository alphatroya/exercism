struct Nucleotide {
    let nucleotide: String

    init(_ nucleotide: String) {
        self.nucleotide = nucleotide
    }

    func complementOfDNA() throws -> String {
        let complements: [Character: String] = [
            "G": "C",
            "C": "G",
            "T": "A",
            "A": "U"
        ]
        return try nucleotide
            .map { character in
                if let result = complements[character] {
                    return result
                } else {
                    throw RnaTranscription.TranscriptionError.invalidNucleotide("\(character) is not a valid Nucleotide")
                }
            }
            .joined()
    }
}

enum TranscriptionError: Error {
    case invalidNucleotide(String)
}
