pub fn verse(n: i32) -> String {
    BottlesConverter { bottles: n }.full_phrase()
}

struct BottlesConverter {
    bottles: i32,
}

impl BottlesConverter {
    fn first_line(&self) -> String {
        match self.bottles {
            0 => "No more bottles of beer on the wall, no more bottles of beer.".to_string(),
            _ => format!(
                "{} of beer on the wall, {} of beer.",
                self.bottles_string(self.bottles),
                self.bottles_string(self.bottles)
            ),
        }
    }

    fn second_line(&self) -> String {
        match self.bottles {
            0 => "Go to the store and buy some more, 99 bottles of beer on the wall.".to_string(),
            1 => {
                "Take it down and pass it around, no more bottles of beer on the wall.".to_string()
            }
            _ => format!(
                "Take one down and pass it around, {} of beer on the wall.",
                self.bottles_string(self.bottles - 1)
            ),
        }
    }

    fn full_phrase(&self) -> String {
        vec![self.first_line(), self.second_line(), "".to_string()].join("\n")
    }

    fn bottles_string(&self, count: i32) -> String {
        if count > 1 {
            format!("{} bottles", count)
        } else {
            format!("{} bottle", count)
        }
    }
}

pub fn sing(start: i32, end: i32) -> String {
    (end..=start)
        .rev()
        .map(|num| verse(num))
        .collect::<Vec<String>>()
        .join("\n")
}
