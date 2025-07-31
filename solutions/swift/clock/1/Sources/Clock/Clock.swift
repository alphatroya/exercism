import Foundation

struct Clock {
    private static let minutesInHour = 60
    private static let hoursInDay = 24

    var hours: Int
    var minutes: Int

    init(hours: Int = 0, minutes: Int = 0) {
        var minutes = minutes
        var hours = hours + minutes / Self.minutesInHour
        minutes %= Self.minutesInHour
        if minutes < 0 {
            minutes += Self.minutesInHour
            hours -= 1
        }
        hours %= Self.hoursInDay
        if hours < 0 {
            hours += Self.hoursInDay
        }

        self.hours = hours
        self.minutes = minutes
    }

    func add(minutes: Int) -> Clock {
        Clock(hours: hours, minutes: self.minutes + minutes)
    }

    func subtract(minutes: Int) -> Clock {
        Clock(hours: hours, minutes: self.minutes - minutes)
    }
}

extension Clock: Equatable {}

extension Clock: CustomStringConvertible {
    var description: String {
        String(format: "%02ld:%02ld", hours, minutes)
    }
}
