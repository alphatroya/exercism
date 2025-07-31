pub fn series(digits: &str, len: usize) -> Vec<String> {
    if digits.len() < len {
        vec![]
    } else if len == 0 {
        vec!["".to_string(); digits.len() + 1]
    } else {
        let mut result = vec![];
        let mut acc = String::new();
        for i in digits.chars() {
            acc.push(i);
            if acc.len() >= len {
                result.push(acc.clone());
                acc = i.to_string();
            }
        }
        result
    }
}
