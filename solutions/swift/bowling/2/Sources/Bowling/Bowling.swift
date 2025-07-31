final class Bowling {
    enum BowlingError: Error {
        case invalidNumberOfPins, tooManyPinsInFrame, gameInProgress, gameIsOver
    }

    enum State {
        case first(strikeCount: Int, isSpare: Bool)
        case second(first: Int, isStrike: Bool)
        case tenthStrikeFirst(isStrike: Bool)
        case tenthStrikeSecond(isStrike: Bool, first: Int)
        case tenthSpare
        case end
    }

    private var state: State = .first(strikeCount: 0, isSpare: false)
    private var scoreValue = 0
    private var turnNumber = 0

    func roll(pins: Int) throws {
        guard pins >= 0, pins <= 10 else {
            throw BowlingError.invalidNumberOfPins
        }
        switch state {
        case let .first(strikeCount, isSpare):
            scoreValue += isSpare ? 2 * pins : pins
            scoreValue += strikeCount * pins
            if pins == 10 {
                turnNumber += 1
                if turnNumber == 10 {
                    state = .tenthStrikeFirst(isStrike: strikeCount > 0)
                } else {
                    state = .first(strikeCount: strikeCount + 1 >= 2 ? 2 : 1, isSpare: false)
                }
            } else {
                state = .second(first: pins, isStrike: strikeCount > 0)
            }
        case let .second(first, isStrike):
            scoreValue += isStrike ? 2 * pins : pins
            turnNumber += 1
            switch first + pins {
            case 11...:
                throw BowlingError.tooManyPinsInFrame
            case 10:
                if turnNumber == 10 {
                    state = .tenthSpare
                } else {
                    state = .first(strikeCount: 0, isSpare: true)
                }
            default:
                if turnNumber == 10 {
                    state = .end
                } else {
                    state = .first(strikeCount: 0, isSpare: false)
                }
            }
        case let .tenthStrikeFirst(isStrike):
            scoreValue += isStrike ? 2 * pins : pins
            state = .tenthStrikeSecond(isStrike: pins == 10, first: pins)
        case let .tenthStrikeSecond(isStrike, first):
            guard first + pins <= 10 || isStrike else {
                throw BowlingError.tooManyPinsInFrame
            }
            scoreValue += pins
            state = .end
        case .tenthSpare:
            scoreValue += pins
            state = .end
        case .end:
            throw BowlingError.gameIsOver
        }
    }

    func score() throws -> Int {
        guard case .end = state else {
            throw BowlingError.gameInProgress
        }
        return scoreValue
    }
}
