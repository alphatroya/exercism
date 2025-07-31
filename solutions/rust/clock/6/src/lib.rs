#![feature(euclidean_division)]
use std::fmt::Display;
use std::fmt::Error;
use std::fmt::Formatter;

#[derive(Debug, PartialEq)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        Clock {
            hours: convert_hours(hours, minutes),
            minutes: convert_minutes(minutes),
        }
    }

    pub fn add_minutes(self, minutes: i32) -> Self {
        Clock::new(self.hours, self.minutes + minutes)
    }
}

impl Display for Clock {
    fn fmt(&self, f: &mut Formatter) -> Result<(), Error> {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}

fn convert_minutes(minutes: i32) -> i32 {
    minutes.mod_euc(60)
}

fn convert_hours(hours: i32, minutes: i32) -> i32 {
    (hours + minutes.div_euc(60)).mod_euc(24)
}
