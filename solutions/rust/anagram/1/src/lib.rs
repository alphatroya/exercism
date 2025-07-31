use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let mut result: HashSet<&'a str> = HashSet::new();

    for possible_anagram in possible_anagrams {
        if possible_anagram.len() != word.len()
            || possible_anagram.to_lowercase() == word.to_lowercase()
        {
            continue;
        }

        let mut possible_letters: Vec<char> = possible_anagram.chars().collect();
        for origin_char in word.chars() {
            if let Some(index) = possible_letters.iter().position(|x| {
                x.to_lowercase().to_string() == origin_char.to_lowercase().to_string()
            }) {
                possible_letters.remove(index);
            }
        }

        if possible_letters.is_empty() {
            result.insert(possible_anagram);
        }
    }

    result
}
