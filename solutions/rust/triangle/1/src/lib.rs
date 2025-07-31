use std::collections::BTreeSet;
use std::iter::FromIterator;

pub struct Triangle {
    uniq_sides: usize,
}

impl Triangle {
    pub fn build(sides: [u64; 3]) -> Option<Triangle> {
        let a = sides[0];
        let b = sides[1];
        let c = sides[2];
        if sides.iter().any(|&x| x == 0) || a + b < c || a + c < b || b + c < a {
            None
        } else {
            Some(Triangle {
                uniq_sides: BTreeSet::from_iter(sides.iter()).len(),
            })
        }
    }

    pub fn is_equilateral(&self) -> bool {
        self.uniq_sides == 1
    }

    pub fn is_scalene(&self) -> bool {
        self.uniq_sides == 3
    }

    pub fn is_isosceles(&self) -> bool {
        self.uniq_sides == 2
    }
}
