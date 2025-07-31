use std::collections::HashMap;

fn valid_nucleotides() -> &'static str {
    "ACGT"
}

pub fn count(nucleotide: char, dna: &str) -> Result<usize, char> {
    let mut dna_combined = String::from(dna);
    dna_combined.insert(dna_combined.len(), nucleotide);
    for dna_char in dna_combined.chars() {
        match valid_nucleotides().chars().find(|x| x == &dna_char) {
            Some(_) => continue,
            None => return Result::Err(dna_char),
        }
    }

    Result::Ok(dna.chars().filter(|x| x == &nucleotide).count())
}

pub fn nucleotide_counts(dna: &str) -> Result<HashMap<char, usize>, char> {
    let mut result = HashMap::new();
    for default_nuclotides in valid_nucleotides().chars() {
        result.insert(default_nuclotides, 0);
    }
    for dna_char in dna.chars() {
        match count(dna_char, dna) {
            Err(error) => return Err(error),
            Ok(count) => {
                result.insert(dna_char, count);
            }
        }
    }
    Result::Ok(result)
}
