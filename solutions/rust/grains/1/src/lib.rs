fn max() -> u32 {
    65
}

pub fn square(s: u32) -> u64 {
    assert!(s > 0 && s < max(), "Square must be between 1 and 64");
    2_u64.pow(s - 1)
}

pub fn total() -> u64 {
    (1..max()).fold(0, |acc, x| {
        acc + square(x)
    })
}
