pub fn nth(n: u32) -> u32 {
    let mut primes: Vec<u32> = vec![];
    let mut number: u32 = 0;
    while primes.len() != (n + 1) as usize {
        if is_prime(number) {
            primes.push(number);
        }
        number += 1;
    }
    primes.pop().unwrap()
}

fn is_prime(n: u32) -> bool {
    if n <= 3 {
        n > 1
    } else if n % 2 == 0 || n % 3 == 0 {
        false
    } else {
        let mut i = 5;
        while i * i <= n {
            if n % i == 0 || n % (i + 2) == 0 {
                return false;
            }
            i += 6;
        }
        true
    }
}
