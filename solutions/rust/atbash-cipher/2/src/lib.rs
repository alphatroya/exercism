/// "Encipher" with the Atbash cipher.
pub fn encode(plain: &str) -> String {
    let plain = filter(plain);
    let count = plain.len();
    let mut result: Vec<char> = vec![];
    for (i, source_char) in plain.into_iter().enumerate() {
        if result.len() % 6 == 5 && (i + 1) != count {
            result.push(' ');
        }
        code(source_char, &mut result);
    }
    result.into_iter().collect()
}

/// "Decipher" with the Atbash cipher.
pub fn decode(cipher: &str) -> String {
    let mut result: Vec<char> = vec![];
    for source_char in filter(cipher) {
        code(source_char, &mut result);
    }
    result.into_iter().collect()
}

fn filter(string: &str) -> Vec<char> {
    string
        .chars()
        .filter(|&x| x.is_ascii())
        .filter(|&x| x.is_alphabetic() || x.is_numeric())
        .collect()
}

fn find(search_char: char) -> Option<char> {
    let mut origin_row = "abcdefghijklmnopqrstuvwxyz".chars();
    let reverse_row = origin_row.clone().rev().collect::<Vec<char>>();

    let search_char = search_char.to_lowercase().next().unwrap();
    if let Some(index) = origin_row.position(|x| x == search_char) {
        Option::Some(reverse_row[index])
    } else {
        None
    }
}

fn code(source_char: char, result: &mut Vec<char>) {
    if source_char.is_numeric() {
        result.push(source_char);
    } else {
        result.push(find(source_char).unwrap());
    }
}
