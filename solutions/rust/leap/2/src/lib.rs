pub fn is_leap_year(year: i32) -> bool {
    is_divisible(year, 4) && !is_divisible(year, 100) || is_divisible(year, 400)
}

fn is_divisible(number: i32, by: i32) -> bool {
    number % by == 0
}
