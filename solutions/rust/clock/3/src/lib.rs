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
        Clock {
            hours: convert_hours(self.hours, self.minutes + minutes),
            minutes: convert_minutes(self.minutes + minutes),
        }
    }
}

impl Display for Clock {
    fn fmt(&self, f: &mut Formatter) -> Result<(), Error> {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}

fn convert_minutes(minutes: i32) -> i32 {
    let real = minutes % 60;
    if real < 0 {
        60 + real
    } else {
        real
    }
}

fn convert_hours(hours: i32, minutes: i32) -> i32 {
    let mut additional_hours = minutes / 60;
    if minutes % 60 < 0 {
        additional_hours -= 1;
    }
    let hours = (hours + additional_hours) % 24;
    if hours < 0 {
        24 + hours
    } else {
        hours
    }
}
