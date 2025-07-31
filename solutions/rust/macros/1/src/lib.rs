#[macro_export]
macro_rules! hashmap {
    ($($x:expr => $y:expr,)+) => {
        hashmap!($($x => $y),*);
    };
    ($($x:expr => $y:expr),*) => {
        {
            let mut temp_hash = HashMap::new();
            $(
                let _ = temp_hash.insert($x, $y);
            )*
            temp_hash
        }
    };
}
