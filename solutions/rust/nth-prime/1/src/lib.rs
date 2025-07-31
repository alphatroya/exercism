pub fn nth(n: u32) -> Option<u32> {
    if n == 0 {
        Option::None
    } else {
        let mut primes: Vec<u32> = vec![];
        let mut number: u32 = 2;
        while primes.len() != n as usize {
            if is_prime(number) {
                primes.push(number);
            }
            number += 1;
        }
        primes.pop()
    }
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
