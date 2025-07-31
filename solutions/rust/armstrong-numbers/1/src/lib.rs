pub fn is_armstrong_number(num: u32) -> bool {
    let mut exp = 0;
    while (10_u32).pow(exp) < num {
        exp += 1;
    }

    let mut sum = 0;
    let mut mut_num = num;
    for _ in 0..exp {
        sum += (mut_num % 10).pow(exp);
        mut_num /= 10;
    }
    sum == num
}
