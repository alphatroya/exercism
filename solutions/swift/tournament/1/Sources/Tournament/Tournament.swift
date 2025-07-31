final class Tournament {
    struct Stats {
        var win: Int = 0
        var draw: Int = 0
        var lose: Int = 0

        var mp: Int {
            win + draw + lose
        }

        var points: Int {
            win * 3 + draw
        }
    }

    func tally(_ input: String) -> String {
        var games: [String: Stats] = [:]
        let lines = input.split(separator: "\n")
        for line in lines {
            let fragments = line.split(separator: ";")
            guard fragments.count == 3 else {
                continue
            }
            let firstCommand = String(fragments[0])
            var firstCommandScore = games[firstCommand, default: Stats()]
            let secondCommand = String(fragments[1])
            var secondCommandScore = games[secondCommand, default: Stats()]
            defer {
                games[firstCommand] = firstCommandScore
                games[secondCommand] = secondCommandScore
            }

            switch fragments[2] {
            case "win":
                firstCommandScore.win += 1
                secondCommandScore.lose += 1
            case "loss":
                firstCommandScore.lose += 1
                secondCommandScore.win += 1
            case "draw":
                firstCommandScore.draw += 1
                secondCommandScore.draw += 1
            default:
                break
            }
        }

        let sorted = games.sorted {
            if $0.value.points == $1.value.points {
                return $0.key < $1.key
            }
            return $0.value.points > $1.value.points
        }

        var result = "Team                           | MP |  W |  D |  L |  P"
        for game in sorted {
            let stats = game.value
            var normalizedName = game.key
            while normalizedName.count < 31 {
                normalizedName.append(" ")
            }
            result += "\n\(normalizedName)|  \(stats.mp) |  \(stats.win) |  \(stats.draw) |  \(stats.lose) |  \(stats.points)"
        }

        return result
    }
}
