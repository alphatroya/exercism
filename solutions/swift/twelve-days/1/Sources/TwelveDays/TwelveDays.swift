enum TwelveDaysSong {
    private static let elements = [
        "a Partridge in a Pear Tree",
        "two Turtle Doves",
        "three French Hens",
        "four Calling Birds",
        "five Gold Rings",
        "six Geese-a-Laying",
        "seven Swans-a-Swimming",
        "eight Maids-a-Milking",
        "nine Ladies Dancing",
        "ten Lords-a-Leaping",
        "eleven Pipers Piping",
        "twelve Drummers Drumming",
    ]

    private static let days = [
        "first",
        "second",
        "third",
        "fourth",
        "fifth",
        "sixth",
        "seventh",
        "eighth",
        "ninth",
        "tenth",
        "eleventh",
        "twelfth",
    ]

    static func verse(_ row: Int) -> String {
        var components = ["On the \(days[row - 1]) day of Christmas my true love gave to me:"]
        if row == 1 {
            components.append(elements[row - 1])
        } else {
            for index in (1 ... row).reversed() {
                switch index {
                case 1:
                    components.append("and")
                    components.append(elements[index - 1])
                default:
                    components.append(elements[index - 1] + ",")
                }
            }
        }
        return components.joined(separator: " ") + "."
    }

    static func verses(_ from: Int, _ to: Int) -> String {
        (from ... to).map { verse($0) }.joined(separator: "\n")
    }

    static func sing() -> String {
        verses(1, 12)
    }
}
