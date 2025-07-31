#![feature(euclidean_division)]

pub fn rotate(input: &str, key: i8) -> String {
    let mut result: Vec<char> = vec![];
    for i in input.chars() {
        translate(i, &mut result, key);
    }
    result.into_iter().collect::<String>()
}

fn find(search_char: char, key: i8) -> Option<char> {
    let mut origin_row = "abcdefghijklmnopqrstuvwxyz".chars();
    let length = origin_row.clone().count();
    let vec_origin = origin_row.clone().collect::<Vec<char>>();
    let key = key as usize;

    let is_uppercase = search_char.is_uppercase();
    let search_char = search_char.to_lowercase().next().unwrap();
    if let Some(index) = origin_row.position(|x| x == search_char) {
        let result = vec_origin[(index + key).mod_euc(length)];
        if is_uppercase {
            Option::Some(result.to_uppercase().next().unwrap())
        } else {
            Option::Some(result)
        }
    } else {
        None
    }
}

fn translate(search_char: char, result: &mut Vec<char>, key: i8) {
    if search_char.is_alphabetic() {
        result.push(find(search_char, key).unwrap());
    } else {
        result.push(search_char);
    }
}
