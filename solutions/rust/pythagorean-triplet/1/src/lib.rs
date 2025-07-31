pub fn find() -> Option<u32> {
    for a in 1..1000 {
        for b in a..1000 {
            let a = a as f64;
            let b = b as f64;
            let c = (a * a + b * b).sqrt();
            if a + b + c == 1000.0 {
                return Option::Some((a * b * c) as u32);
            }
        }
    }
    Option::None
}
