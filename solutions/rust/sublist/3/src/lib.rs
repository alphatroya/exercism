#[derive(Debug, PartialEq)]
pub enum Comparison {
    Sublist,
    Equal,
    Unequal,
    Superlist,
}

pub fn sublist<T: PartialEq>(first: &[T], second: &[T]) -> Comparison {
    if first == second {
        Comparison::Equal
    } else if first.len() < second.len() && is_contain(first, second) {
        Comparison::Sublist
    } else if is_contain(second, first) {
        Comparison::Superlist
    } else {
        Comparison::Unequal
    }
}

fn is_contain<T: PartialEq>(subarray: &[T], superarray: &[T]) -> bool {
    let window_size = subarray.len();
    if window_size == 0 {
        return true;
    }
    let windows = superarray.windows(window_size);
    for window in windows {
        if window == subarray {
            return true;
        }
    }
    false
}
