struct Anagram {
    var word: String

    func match(_ variants: [String]) -> [String] {
        return variants.filter { variant in
            let variant = variant.lowercased()
            let origin = self.word.lowercased()
            guard variant != origin, variant.count == self.word.count else {
                return false
            }
            var wordChars = Array(origin)
            for char in variant {
                if let index = wordChars.firstIndex(where: { $0 == char }) {
                    wordChars.remove(at: index)
                }
            }
            return wordChars.isEmpty
        }
    }
}
