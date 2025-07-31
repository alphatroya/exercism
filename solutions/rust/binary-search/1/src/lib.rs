pub fn find(array: &[i32], key: i32) -> Option<usize> {
    match array.len() {
        0 => None,
        1 => if array[0] == key {
            Some(0)
        } else {
            None
        },
        _ => {
            let middle = array.len() / 2;
            let split = array.split_at(middle);
            if array[middle] > key {
                find(split.0, key)
            } else {
                match find(split.1, key) {
                    None => None,
                    Some(index) => Some(middle + index),
                }
            }
        }
    }
}
