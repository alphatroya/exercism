use std::collections::BTreeMap;

pub fn transform(h: &BTreeMap<i32, Vec<char>>) -> BTreeMap<char, i32> {
    h.into_iter().fold(BTreeMap::new(), |result, element| {
        let mut result = result;
        for j in element.1.iter().map(|x| x.to_ascii_lowercase()) {
            result.insert(j, *element.0);
        }
        result
    })
}
