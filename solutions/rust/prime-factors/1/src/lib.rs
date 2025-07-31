pub fn factors(n: u64) -> Vec<u64> {
    let mut result: Vec<u64> = vec![];
    let mut n = n;
    let mut divider = 2;
    while n != 1 {
        if n % divider == 0 {
            n /= divider;
            result.push(divider);
        } else {
            divider += 1;
        }
    }
    result
}
