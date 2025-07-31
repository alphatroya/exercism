struct DNA {
    let strand: String

    init?(strand: String) {
        for char in strand {
            switch char {
            case "A", "T", "C", "G":
                continue
            default:
                return nil
            }
        }
        self.strand = strand
    }

    func count(_ nucl: Character) -> Int {
        return strand.reduce(0) { result, character in
            character == nucl ? result + 1 : result
        }
    }

    func counts() -> [String: Int] {
        return "TACG".map { ($0, self.count($0)) }
            .reduce(into: [String: Int]()) { result, elements in
                result[String(elements.0)] = elements.1
            }
    }
}