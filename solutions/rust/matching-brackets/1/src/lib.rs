pub fn brackets_are_balanced(string: &str) -> bool {
    BracketValidator::from(string).is_valid
}

struct BracketValidator {
    is_valid: bool,
}

impl<'a> From<&'a str> for BracketValidator {
    fn from(string: &'a str) -> Self {
        let find_opposite = |bracket| match bracket {
            ')' => Option::Some('('),
            ']' => Option::Some('['),
            '}' => Option::Some('{'),
            _ => None,
        };
        let mut result: Vec<char> = vec![];
        for x in string.chars() {
            match x {
                '[' | '(' | '{' => result.push(x),
                ']' | ')' | '}' => {
                    if let Some(bracket) = result.clone().into_iter().last() {
                        if let Some(opposite) = find_opposite(x) {
                            if bracket == opposite {
                                result.pop();
                            } else {
                                return BracketValidator { is_valid: false };
                            }
                        }
                    }
                }
                _ => continue,
            };
        }
        BracketValidator {
            is_valid: result.len() == 0,
        }
    }
}
