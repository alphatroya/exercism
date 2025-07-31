import Foundation

final class Gigasecond {
    static private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter
    }()

    private let date: Date

    init?(from stringDate: String) {
        guard let date = type(of: self).dateFormatter.date(from: stringDate) else {
            return nil
        }
        self.date = date
    }

    var description: String {
        let futureDate = date.addingTimeInterval(pow(10, 9))
        return type(of: self).dateFormatter.string(from: futureDate)
    }
}
