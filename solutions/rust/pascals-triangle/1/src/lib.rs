pub struct PascalsTriangle {
    row_count: u32,
}

impl PascalsTriangle {
    pub fn new(row_count: u32) -> Self {
        PascalsTriangle { row_count }
    }

    pub fn rows(&self) -> Vec<Vec<u32>> {
        if self.row_count == 0 {
            return vec![];
        }
        (0..self.row_count)
            .into_iter()
            .map(|x| self.row(x))
            .collect::<Vec<Vec<u32>>>()
    }

    fn row(&self, index: u32) -> Vec<u32> {
        match index {
            0 => vec![1],
            1 => vec![1, 1],
            _ => {
                let previous_row = self.row(index - 1);
                let mut result: Vec<u32> = vec![];
                for (i, element) in previous_row.clone().into_iter().enumerate() {
                    let next = previous_row.clone().into_iter().nth(i + 1);
                    match next {
                        Some(next) => result.push(next + element),
                        None => {}
                    }
                }
                result.insert(0, 1);
                result.push(1);
                result
            }
        }
    }
}
