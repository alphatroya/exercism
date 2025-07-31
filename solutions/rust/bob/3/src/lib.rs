pub fn reply(message: &str) -> &str {
    let message = message.trim();
    if message.is_empty() {
        return "Fine. Be that way!";
    }
    let is_uppercased = message.to_uppercase() == message;
    let is_without_letters = message.to_uppercase().chars().all(|x| !x.is_uppercase());
    match message.chars().last() {
        Some('?') => {
            if is_uppercased && !is_without_letters {
                "Calm down, I know what I'm doing!"
            } else {
                "Sure."
            }
        }
        _ => {
            if is_uppercased && !is_without_letters {
                "Whoa, chill out!"
            } else {
                "Whatever."
            }
        }
    }
}
