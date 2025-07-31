#[derive(Debug, PartialEq)]
pub struct DNA<'a> {
    dna: &'a str,
}

#[derive(Debug, PartialEq)]
pub struct RNA {
    rna: String,
}

impl<'a> DNA<'a> {
    pub fn new(dna: &str) -> Result<DNA, usize> {
        match dna.chars().position(|x| !"CGAT".contains(x)) {
            Some(index) => Result::Err(index),
            None => Result::Ok(DNA { dna }),
        }
    }

    pub fn into_rna(self) -> RNA {
        let mapped = self
            .dna
            .chars()
            .map(|x| match x {
                'G' => 'C',
                'C' => 'G',
                'T' => 'A',
                'A' => 'U',
                x => x,
            })
            .collect::<String>();
        RNA::new(&mapped[..]).unwrap()
    }
}

impl RNA {
    pub fn new(rna: &str) -> Result<RNA, usize> {
        match rna.chars().position(|x| !"CGAU".contains(x)) {
            Some(index) => Result::Err(index),
            None => Result::Ok(RNA {
                rna: rna.to_owned(),
            }),
        }
    }
}
