pub fn square_of_sum(n: usize) -> usize {
    let sum: usize = (0..=n).sum();
    sum * sum
}

pub fn sum_of_squares(n: usize) -> usize {
    (0..=n).map(|num| num * num).sum()
}

pub fn difference(n: usize) -> usize {
    square_of_sum(n) - sum_of_squares(n)
}
