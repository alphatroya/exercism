extern crate num;

use num::Num;
use num::Zero;

pub struct Triangle<T> {
    a: T,
    b: T,
    c: T,
}

impl<T> Triangle<T>
where
    T: Num + PartialOrd + Copy,
{
    pub fn build(sides: [T; 3]) -> Option<Triangle<T>> {
        let a = sides[0];
        let b = sides[1];
        let c = sides[2];
        if sides.iter().any(|&x| x == Zero::zero()) || a + b < c || a + c < b || b + c < a {
            None
        } else {
            Some(Triangle { a, b, c })
        }
    }

    pub fn is_equilateral(&self) -> bool {
        self.a == self.b && self.b == self.c
    }

    pub fn is_scalene(&self) -> bool {
        !self.is_equilateral() && !self.is_isosceles()
    }

    pub fn is_isosceles(&self) -> bool {
        !self.is_equilateral() && (self.a == self.b || self.b == self.c || self.a == self.c)
    }
}
