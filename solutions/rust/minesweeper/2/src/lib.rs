use std::borrow::Borrow;

pub fn annotate(minefield: &[&str]) -> Vec<String> {
    let mut result: Vec<String> = minefield
        .iter()
        .map(|x| String::from(*x))
        .collect::<Vec<String>>();
    for (line, value) in minefield.iter().enumerate() {
        for (row, character) in value.chars().enumerate() {
            if character != '*' {
                continue;
            }
            let row = row as isize;

            if line > 0 {
                if let Some(previous_line) = result.get(line - 1) {
                    result[line - 1] = increment(previous_line.borrow(), vec![row - 1, row, row + 1])
                }
            }
            if let Some(current_line) = result.get(line) {
                result[line] = increment(current_line.borrow(), vec![row - 1, row, row + 1])
            }
            if let Some(next_line) = result.get(line + 1) {
                result[line + 1] = increment(next_line.borrow(), vec![row - 1, row, row + 1])
            }
        }
    }
    result
}

fn increment(string: &str, rows: Vec<isize>) -> String {
    let rows = rows
        .iter()
        .filter(|&&x| x >= 0 && x < (string.len() as isize))
        .map(|&x| x as usize)
        .collect::<Vec<usize>>();
    string
        .chars()
        .enumerate()
        .map(|(index, character)| {
            if !rows.contains(&index) || character == '*' {
                character.to_string()
            } else {
                let new_value = character.to_digit(10).unwrap_or(0) + 1;
                new_value.to_string()
            }
        })
        .collect::<String>()
}
