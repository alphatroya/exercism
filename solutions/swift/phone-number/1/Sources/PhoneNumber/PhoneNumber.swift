struct PhoneNumber {
    var number: String

    var areaCode: String {
        String(number.dropLast(7))
    }

    init(_ number: String) {
        var number = number.filter { !$0.isWhitespace &&  !$0.isPunctuation }

        if number.starts(with: "1") {
            number = String(number.dropFirst())
        }

        if number.count != 10 {
            number = "0000000000"
        }

        self.number = number
    }
}

extension PhoneNumber: CustomStringConvertible {
    var description: String {
        "(\(areaCode)) " + String(number.dropFirst(3).dropLast(4)) + "-" + String(number.dropFirst(6))
    }
}
