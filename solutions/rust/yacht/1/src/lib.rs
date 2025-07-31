use std::collections::HashMap;

pub enum Category {
    Ones,
    Twos,
    Threes,
    Fours,
    Fives,
    Sixes,
    FullHouse,
    FourOfAKind,
    LittleStraight,
    BigStraight,
    Choice,
    Yacht,
}

type Dice = [u8; 5];
pub fn score(dice: Dice, category: Category) -> u8 {
    match category {
        Category::Yacht => yacht_dice(dice),
        Category::Ones => number_dice(dice, 1),
        Category::Twos => number_dice(dice, 2),
        Category::Threes => number_dice(dice, 3),
        Category::Fours => number_dice(dice, 4),
        Category::Fives => number_dice(dice, 5),
        Category::Sixes => number_dice(dice, 6),
        Category::FullHouse => full_house(dice),
        Category::FourOfAKind => four_of_kind(dice),
        Category::LittleStraight => {
            let mut dice = dice;
            dice.sort();
            return if dice == [1, 2, 3, 4, 5] { 30 } else { 0 };
        }
        Category::BigStraight => {
            let mut dice = dice;
            dice.sort();
            return if dice == [2, 3, 4, 5, 6] { 30 } else { 0 };
        }
        Category::Choice => dice.iter().sum(),
    }
}

fn yacht_dice(dice: Dice) -> u8 {
    let item = dice[0];
    if dice.iter().all(|x| item == *x) {
        50
    } else {
        0
    }
}

fn counter(dice: Dice) -> HashMap<u8, u8> {
    let mut c: HashMap<u8, u8> = HashMap::new();
    for x in dice {
        let this = c.get(&x);
        match this {
            Some(y) => c.insert(x, y + 1),
            None => c.insert(x, 1),
        };
    }
    return c;
}

fn four_of_kind(dice: Dice) -> u8 {
    let counter = counter(dice);
    let mut sum: u8 = 0;
    for (key, value) in counter.iter() {
        if value < &4 {
            continue;
        }
        sum += key * 4;
    }

    return sum;
}

fn full_house(dice: Dice) -> u8 {
    let counter = counter(dice);

    if counter.len() != 2 {
        return 0;
    }

    let mut sum: u8 = 0;
    for (key, value) in counter.iter() {
        if value < &2 {
            return 0;
        }
        sum += key * value;
    }

    return sum;
}

fn number_dice(dice: Dice, number: u8) -> u8 {
    dice.into_iter()
        .filter(|x| *x == number)
        .fold(0, |acc, x| acc + x)
}
