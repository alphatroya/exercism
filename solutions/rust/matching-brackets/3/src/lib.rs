pub fn brackets_are_balanced(string: &str) -> bool {
    BracketValidator::from(string).is_valid()
}

struct BracketValidator<'a> {
    string: &'a str,
}

impl<'a> BracketValidator<'a> {
    fn is_valid(self) -> bool {
        let find_opposite = |bracket| match bracket {
            ')' => Option::Some('('),
            ']' => Option::Some('['),
            '}' => Option::Some('{'),
            _ => None,
        };
        let mut result: Vec<char> = vec![];
        for x in self.string.chars() {
            match x {
                '[' | '(' | '{' => result.push(x),
                ']' | ')' | '}' => {
                    if let Some(bracket) = result.iter().last().map(|last| last.clone()) {
                        if let Some(opposite) = find_opposite(x) {
                            if bracket == opposite {
                                result.pop();
                            } else {
                                return false;
                            }
                        }
                    }
                }
                _ => continue,
            };
        }
        result.len() == 0
    }
}

impl<'a> From<&'a str> for BracketValidator<'a> {
    fn from(string: &'a str) -> Self {
        BracketValidator { string }
    }
}
