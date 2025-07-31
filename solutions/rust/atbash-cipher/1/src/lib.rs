/// "Encipher" with the Atbash cipher.
pub fn encode(plain: &str) -> String {
    let plain = plain
        .chars()
        .filter(|&x| x != ' ')
        .filter(|&x| x.is_ascii());
    let count = plain.clone().count();
    let mut result: Vec<char> = vec![];
    for (i, source_char) in plain.enumerate() {
        if result.len() % 6 == 5 && (i + 1) != count {
            result.push(' ');
        }
        code(source_char, &mut result);
    }
    result.into_iter().collect()
}

/// "Decipher" with the Atbash cipher.
pub fn decode(cipher: &str) -> String {
    let plain = cipher.chars().filter(|&x| x != ' ');
    let mut result: Vec<char> = vec![];
    for source_char in plain {
        code(source_char, &mut result);
    }
    result.into_iter().collect()
}

fn find(search_char: char) -> Option<char> {
    let origin_row = "abcdefghijklmnopqrstuvwxyz".chars();
    let reverse_row = origin_row.clone().rev();

    for (j, current_char) in origin_row.clone().enumerate() {
        if current_char == search_char.to_lowercase().next().unwrap() {
            let new_char = reverse_row.clone().collect::<Vec<char>>()[j];
            return Option::Some(new_char);
        }
    }
    None
}

fn code(source_char: char, result: &mut Vec<char>) {
    if source_char.to_string().parse::<i8>().is_ok() {
        &result.push(source_char);
    } else {
        match find(source_char) {
            Some(new_char) => result.push(new_char),
            None => return,
        }
    }
}
