pub fn reply(message: &str) -> &str {
    if message.chars().all(|x| x.is_ascii_whitespace()) {
        return "Fine. Be that way!";
    }
    match message.chars().filter(|x| !x.is_ascii_whitespace()).last() {
        Some('?') => {
            if message
                .chars()
                .take(message.len() - 1)
                .filter(|x| !x.is_ascii_whitespace())
                .all(|x| x.is_uppercase() && x.is_ascii_alphabetic())
            {
                return "Calm down, I know what I'm doing!";
            } else {
                return "Sure.";
            }
        }
        Some('!') => {
            if message
                .chars()
                .filter(|x| !x.is_ascii_whitespace())
                .filter(|x| !x.is_ascii_punctuation())
                .filter(|x| !x.is_ascii_digit())
                .all(|x| x.is_uppercase())
            {
                return "Whoa, chill out!";
            }
        }
        _ => {}
    }
    if message
        .chars()
        .filter(|x| !x.is_ascii_whitespace())
        .all(|x| x.is_uppercase() && x.is_ascii_alphabetic())
    {
        "Whoa, chill out!"
    } else {
        "Whatever."
    }
}
