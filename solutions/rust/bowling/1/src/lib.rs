#[derive(Debug, PartialEq)]
pub enum Error {
    NotEnoughPinsLeft,
    GameComplete,
}

enum BowlingState {
    First { strike_count: u16, is_spare: bool },
    Second { first: u16, is_strike: bool },
    TenthStrikeFirst { is_strike: bool },
    TenthStrikeSecond { is_strike: bool, first: u16 },
    TenthSpare,
    End,
}

impl Default for BowlingState {
    fn default() -> Self {
        BowlingState::First {
            strike_count: 0,
            is_spare: false,
        }
    }
}

#[derive(Default)]
pub struct BowlingGame {
    state: BowlingState,
    score_value: u16,
    turn_number: u16,
}

impl BowlingGame {
    pub fn new() -> Self {
        BowlingGame::default()
    }

    pub fn roll(&mut self, pins: u16) -> Result<(), Error> {
        if pins > 10 {
            return Err(Error::NotEnoughPinsLeft);
        }
        match self.state {
            BowlingState::First {
                strike_count,
                is_spare,
            } => {
                self.score_value += if is_spare { 2 * pins } else { pins };
                self.score_value += strike_count * pins;
                if pins == 10 {
                    self.turn_number += 1;
                    if self.turn_number == 10 {
                        self.state = BowlingState::TenthStrikeFirst {
                            is_strike: strike_count > 0,
                        };
                    } else {
                        let new_strike_count = if strike_count + 1 >= 2 { 2 } else { 1 };
                        self.state = BowlingState::First {
                            strike_count: new_strike_count,
                            is_spare: false,
                        };
                    }
                } else {
                    self.state = BowlingState::Second {
                        first: pins,
                        is_strike: strike_count > 0,
                    };
                }
            }
            BowlingState::Second { first, is_strike } => {
                self.score_value += if is_strike { 2 * pins } else { pins };
                self.turn_number += 1;
                match first + pins {
                    11..=std::u16::MAX => {
                        return Err(Error::NotEnoughPinsLeft);
                    }
                    10 => {
                        if self.turn_number == 10 {
                            self.state = BowlingState::TenthSpare
                        } else {
                            self.state = BowlingState::First {
                                strike_count: 0,
                                is_spare: true,
                            }
                        }
                    }
                    _ => {
                        if self.turn_number == 10 {
                            self.state = BowlingState::End
                        } else {
                            self.state = BowlingState::First {
                                strike_count: 0,
                                is_spare: false,
                            }
                        }
                    }
                }
            }
            BowlingState::TenthStrikeFirst { is_strike } => {
                self.score_value += if is_strike { 2 * pins } else { pins };
                self.state = BowlingState::TenthStrikeSecond {
                    is_strike: pins == 10,
                    first: pins,
                };
            }
            BowlingState::TenthStrikeSecond { is_strike, first } => {
                if first + pins > 10 && !is_strike {
                    return Err(Error::NotEnoughPinsLeft);
                }
                self.score_value += pins;
                self.state = BowlingState::End;
            }
            BowlingState::TenthSpare => {
                self.score_value += pins;
                self.state = BowlingState::End;
            }
            BowlingState::End => return Err(Error::GameComplete),
        };
        Ok(())
    }

    pub fn score(&self) -> Option<u16> {
        match &self.state {
            BowlingState::End => Some(self.score_value),
            _ => None,
        }
    }
}
