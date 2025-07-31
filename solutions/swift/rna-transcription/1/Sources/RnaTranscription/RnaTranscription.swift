struct Nucleotide {
    let nucleotide: String

    init(_ nucleotide: String) {
        self.nucleotide = nucleotide
    }

    func complementOfDNA() throws -> String {
        var result = ""
        for char in nucleotide {
            switch char {
            case "G":
                result.append("C")
            case "C":
                result.append("G")
            case "T":
                result.append("A")
            case "A":
                result.append("U")
            default:
                throw RnaTranscription.TranscriptionError.invalidNucleotide("\(char) is not a valid Nucleotide")
            }
        }
        return result
    }
}

enum RnaTranscription {
    enum TranscriptionError: Error {
        case invalidNucleotide(String)
    }
}