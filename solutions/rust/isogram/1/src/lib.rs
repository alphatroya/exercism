use std::collections::HashSet;

pub fn check(candidate: &str) -> bool {
    let filtered_chars = candidate
        .chars()
        .filter(|&x| x != ' ' && x != '-')
        .collect::<String>()
        .to_lowercase();
    let chars_set = filtered_chars.chars().collect::<HashSet<char>>();
    chars_set.len() == filtered_chars.len()
}
