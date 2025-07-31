#![feature(vec_remove_item)]
use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let mut result: HashSet<&'a str> = HashSet::new();

    let lowercase_word = word.to_lowercase();
    for possible_anagram in possible_anagrams {
        let lowercase_possible_anagram = possible_anagram.to_lowercase();
        if possible_anagram.len() != lowercase_word.len()
            || lowercase_possible_anagram == lowercase_word
        {
            continue;
        }

        let mut possible_letters: Vec<char> = lowercase_possible_anagram.chars().collect();
        for origin_char in lowercase_word.chars() {
            possible_letters.remove_item(&origin_char);
        }

        if possible_letters.is_empty() {
            result.insert(possible_anagram);
        }
    }

    result
}
