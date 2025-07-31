pub fn is_leap_year(year: i32) -> bool {
    if !is_divisible(year, 4) {
        return false;
    }

    if !is_divisible(year, 100) {
        return true;
    }

    if is_divisible(year, 400) {
        true
    } else {
        false
    }
}

fn is_divisible(number: i32, by: i32) -> bool {
    if number % by == 0 {
        true
    } else {
        false
    }
}
