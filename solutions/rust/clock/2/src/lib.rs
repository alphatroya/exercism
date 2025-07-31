use std::fmt::Display;
use std::fmt::Error;
use std::fmt::Formatter;

#[derive(Debug)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    fn real_minutes(&self) -> i32 {
        let real = self.minutes % 60;
        if real < 0 {
            60 + real
        } else {
            real
        }
    }

    fn real_hours(&self) -> i32 {
        let mut additional_hours = self.minutes / 60;
        if self.minutes % 60 < 0 {
            additional_hours -= 1;
        }
        let hours = (self.hours + additional_hours) % 24;
        if hours < 0 {
            24 + hours
        } else {
            hours
        }
    }

    pub fn new(hours: i32, minutes: i32) -> Self {
        Clock { hours, minutes }
    }

    pub fn add_minutes(self, minutes: i32) -> Self {
        let mut copy = self;
        copy.minutes += minutes;
        copy
    }
}

impl Display for Clock {
    fn fmt(&self, f: &mut Formatter) -> Result<(), Error> {
        write!(f, "{:02}:{:02}", self.real_hours(), self.real_minutes())
    }
}

impl PartialEq for Clock {
    fn eq(&self, other: &Clock) -> bool {
        self.real_hours() == other.real_hours() && self.real_minutes() == other.real_minutes()
    }
}
