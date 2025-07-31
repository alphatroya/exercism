pub fn abbreviate(phrase: &str) -> String {
    let mut previous_char: Option<char> = None;
    phrase
        .chars()
        .filter(|&x| {
            let old_previous_char = previous_char;
            previous_char = Some(x);
            match old_previous_char {
                None => x.is_uppercase(),
                Some(' ') | Some('-') => true,
                Some(previous_char) => !previous_char.is_uppercase() && x.is_uppercase(),
            }
        })
        .collect::<String>()
        .to_uppercase()
}
