#[derive(Debug, PartialEq)]
pub struct DNA<'a> {
    dna: &'a str,
}

#[derive(Debug, PartialEq)]
pub struct RNA {
    nucleotides: String,
}

impl<'a> DNA<'a> {
    pub fn new(dna: &str) -> Result<DNA, usize> {
        match dna
            .chars()
            .position(|x| x != 'C' && x != 'G' && x != 'A' && x != 'T')
        {
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
        let string = &mapped[..];
        RNA::new(string).unwrap()
    }
}

impl RNA {
    pub fn new(rna: &str) -> Result<RNA, usize> {
        match rna
            .chars()
            .position(|x| x != 'C' && x != 'G' && x != 'A' && x != 'U')
        {
            Some(index) => Result::Err(index),
            None => Result::Ok(RNA {
                nucleotides: rna.to_owned(),
            }),
        }
    }
}
