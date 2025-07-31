/// `Palindrome` is a newtype which only exists when the contained value is a palindrome number in base ten.
///
/// A struct with a single field which is used to constrain behavior like this is called a "newtype", and its use is
/// often referred to as the "newtype pattern". This is a fairly common pattern in Rust.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct Palindrome(u64);

impl Palindrome {
    /// Create a `Palindrome` only if `value` is in fact a palindrome when represented in base ten. Otherwise, `None`.
    pub fn new(value: u64) -> Option<Palindrome> {
        if value < 10 {
            return Some(Palindrome(value));
        }

        let mut vec: Vec<u64> = Vec::new();

        let mut reminder: u64 = value;
        while reminder > 0 {
            vec.push(reminder % 10);
            reminder /= 10;
        }

        for (num, rev) in vec.iter().zip(vec.iter().rev()) {
            if *num != *rev {
                return None;
            }
        }
        Some(Palindrome(value))
    }

    /// Get the value of this palindrome.
    pub fn into_inner(self) -> u64 {
        self.0
    }
}

pub fn palindrome_products(min: u64, max: u64) -> Option<(Palindrome, Palindrome)> {
    if min > max {
        return None;
    }
    let mut min_p: Option<Palindrome> = None;
    let mut max_p: Option<Palindrome> = None;

    for i in min..=max {
        for j in i..=max {
            match Palindrome::new(i * j) {
                None => continue,
                Some(p) => {
                    min_p =
                        Some(min_p.map_or(p, |x| Palindrome(p.into_inner().min(x.into_inner()))));
                    max_p =
                        Some(max_p.map_or(p, |x| Palindrome(p.into_inner().max(x.into_inner()))));
                }
            }
        }
    }
    match (min_p, max_p) {
        (Some(min), Some(max)) => Some((min, max)),
        _ => None,
    }
}
