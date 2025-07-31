pub fn build_proverb(list: &[&str]) -> String {
    let mut result = String::new();
    for (index, item) in list.iter().enumerate() {
        if index == 0 {
            continue;
        }
        result.insert_str(
            result.len(),
            format!("For want of a {} the {} was lost.\n", list[index - 1], item).as_str(),
        );
    }
    if !list.is_empty() {
        result.insert_str(
            result.len(),
            format!("And all for the want of a {}.", list[0]).as_str(),
        );
    }
    result
}
