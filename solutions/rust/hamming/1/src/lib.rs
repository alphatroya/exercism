/// Return the Hamming distance between the strings,
/// or None if the lengths are mismatched.
pub fn hamming_distance(s1: &str, s2: &str) -> Option<usize> {
    if s1.len() != s2.len() {
        return Option::None;
    }
    let mut result = 0;
    let mut s1 = s1.chars();
    let mut s2 = s2.chars();
    loop {
        let c1 = s1.next();
        let c2 = s2.next();
        match (c1, c2) {
            (Some(c1), Some(c2)) => {
                if c1 != c2 {
                    result += 1;
                }
            }
            _ => break,
        }
    }
    Option::Some(result)
}
