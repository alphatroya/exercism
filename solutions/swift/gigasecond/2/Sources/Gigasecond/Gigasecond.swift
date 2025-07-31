import Foundation

struct Gigasecond {
    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter
    }()

    let description: String

    init?(from stringDate: String) {
        guard let date = type(of: self).dateFormatter.date(from: stringDate) else {
            return nil
        }
        let futureDate = date.addingTimeInterval(pow(10, 9))
        description = Gigasecond.dateFormatter.string(from: futureDate)
    }
}
