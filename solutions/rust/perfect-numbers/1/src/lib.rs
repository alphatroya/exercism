use std::cmp::Ordering;

#[derive(Debug, PartialEq, Eq)]
pub enum Classification {
    Abundant,
    Perfect,
    Deficient,
}

pub fn classify(num: u64) -> Option<Classification> {
    if num == 0 {
        Option::None
    } else {
        let sum: u64 = (1..num).filter(|i| num % i == 0).sum();
        match sum.cmp(&num) {
            Ordering::Less => Option::Some(Classification::Deficient),
            Ordering::Equal => Option::Some(Classification::Perfect),
            Ordering::Greater => Option::Some(Classification::Abundant),
        }
    }
}
