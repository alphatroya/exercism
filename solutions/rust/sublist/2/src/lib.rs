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
    if subarray.len() == 0 {
        return true;
    }
    for i in 0..superarray.len() {
        for (j, sub_element) in subarray.into_iter().enumerate() {
            match superarray.into_iter().nth(i + j) {
                Some(super_element) => {
                    if sub_element != super_element {
                        break;
                    }
                    if j == subarray.len() - 1 {
                        return true;
                    }
                }
                None => break,
            }
        }
    }
    false
}
