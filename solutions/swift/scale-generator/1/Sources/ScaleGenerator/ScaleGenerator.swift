class ScaleGenerator {
    private static let chromaticSharps = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"]
    private static let chromaticFlats = ["A", "Bb", "B", "C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab"]

    let tonic: String
    let scaleName: String
    let pattern: String

    var name: String {
        "\(tonic) \(scaleName)"
    }

    private let currentScale: [String]

    init(tonic: String, scaleName: String, pattern: String = String(repeating: "m", count: 12)) {
        self.tonic = tonic.normalized()
        self.scaleName = scaleName
        self.pattern = pattern

        switch (tonic, scaleName) {
        case ("F", _), ("Bb", _), ("Eb", _), ("Ab", _),
             ("Db", _), ("Gb", "major"), ("d", _), ("g", _),
             ("c", _), ("f", _), ("bb", _), ("eb", "minor"):
            currentScale = Self.chromaticFlats
        default:
            currentScale = Self.chromaticSharps
        }
    }

    func pitches() -> [String] {
        guard var index = currentScale.firstIndex(of: tonic) else {
            return []
        }

        return [tonic] + pattern.dropLast().map { char in
            index = (index + self.step(for: char)) % currentScale.count
            return currentScale[index]
        }
    }

    private func step(for char: Character) -> Int {
        switch char {
        case "m":
            return 1
        case "M":
            return 2
        case "A":
            return 3
        default:
            preconditionFailure("wrong char")
        }
    }
}

private extension String {
    func normalized() -> String {
        guard let first = first else {
            return self
        }
        return first.uppercased() + dropFirst()
    }
}
