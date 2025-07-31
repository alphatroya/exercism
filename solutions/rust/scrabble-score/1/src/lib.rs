pub fn score(word: &str) -> u64 {
    word.to_lowercase().chars().fold(0, |result, new_char| {
        match new_char {
            'a' | 'e' | 'i' | 'o' | 'u' | 'l' | 'n' | 'r' | 's' | 't' => result + 1,
            'd' | 'g' => result + 2,
            'b' | 'c' | 'm' | 'p' => result + 3,
            'f' | 'h' | 'v' | 'w' | 'y' => result + 4,
            'k' => result + 5,
            'j' | 'x' => result + 8,
            'q' | 'z' => result + 10,
            _ => result
        }
    })
}
