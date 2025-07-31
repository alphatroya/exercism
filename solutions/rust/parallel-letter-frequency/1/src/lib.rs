use std::collections::HashMap;
use std::sync::mpsc;
use std::thread;
use threadpool::ThreadPool;

pub fn frequency(input: &[&str], worker_count: usize) -> HashMap<char, usize> {
    let (tx, rx) = mpsc::channel();

    let pool = ThreadPool::new(worker_count);
    let input: Vec<String> = input.iter().cloned().map(String::from).collect();

    let t0 = thread::spawn(move || {
        for input_phrase in input {
            let tx1 = mpsc::Sender::clone(&tx);
            pool.execute(move || {
                let mut result = HashMap::new();
                for letter in input_phrase.to_lowercase().chars() {
                    if !letter.is_alphanumeric() || letter.is_numeric() {
                        continue;
                    }
                    let count = *result.get(&letter).unwrap_or(&0);
                    result.insert(letter, count + 1);
                }
                tx1.send(result).unwrap();
            });
        }
        pool.join();
    });

    t0.join().unwrap();

    let mut result = HashMap::new();
    for received in rx {
        for (key, value) in received {
            let count = *result.get(&key).unwrap_or(&0);
            result.insert(key, count + value);
        }
    }

    result
}
