/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    let symbols = code
        .chars()
        .filter(|x| x != &' ')
        .map(|x| x.to_string().parse::<i8>());

    if symbols.clone().count() == 1 {
        false
    } else if !symbols.clone().all(|e| e.is_ok()) {
        false
    } else {
        symbols
            .rev()
            .enumerate()
            .map(|x| {
                let index = x.0;
                let element = x.1.unwrap_or(0);

                if index % 2 != 0 {
                    let element = element * 2;
                    if element > 9 {
                        element - 9
                    } else {
                        element
                    }
                } else {
                    element
                }
            })
            .fold(0, |acc, x| acc + x) % 10 == 0
    }
}
