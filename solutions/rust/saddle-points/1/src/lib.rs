pub fn find_saddle_points(input: &[Vec<u64>]) -> Vec<(usize, usize)> {
    let mut saddles: Vec<(usize, usize)> = vec![];
    for (i, row) in input.into_iter().enumerate() {
        let max = row.into_iter().max();
        match max {
            None => {
                return vec![];
            }
            Some(max) => {
                for (j, item) in row.into_iter().enumerate() {
                    if item != max {
                        continue;
                    }

                    let mut is_saddle = true;

                    for row in input {
                        if &row[j] < item {
                            is_saddle = false;
                            break;
                        }
                    }

                    if is_saddle {
                        saddles.push((i, j));
                    }
                }
            }
        }
    }
    return saddles;
}
