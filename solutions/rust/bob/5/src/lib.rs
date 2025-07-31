pub fn reply(message: &str) -> &str {
    let message = message.trim();
    if message.is_empty() {
        return "Fine. Be that way!";
    }

    let mut has_uppercase = false;
    let mut has_lowercase = false;
    for message_char in message.chars() {
        has_uppercase = has_uppercase || message_char.is_uppercase();
        has_lowercase = has_lowercase || message_char.is_lowercase();
        if has_uppercase && has_lowercase {
            break;
        }
    }

    if message.ends_with('?') {
        if has_uppercase && !has_lowercase {
            "Calm down, I know what I'm doing!"
        } else {
            "Sure."
        }
    } else if has_uppercase && !has_lowercase {
        "Whoa, chill out!"
    } else {
        "Whatever."
    }
}
