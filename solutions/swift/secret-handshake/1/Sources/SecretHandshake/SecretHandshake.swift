struct SecretHandshake {
    let value: UInt8

    init(_ value: UInt8) {
        self.value = value
    }

    var commands: [String] {
        var result: [String] = []
        var value = self.value
        for i in 0 ... 4 {
            if value & 0b1 == 1 {
                switch i {
                case 0:
                    result.append("wink")
                case 1:
                    result.append("double blink")
                case 2:
                    result.append("close your eyes")
                case 3:
                    result.append("jump")
                case 4:
                    result.reverse()
                default:
                    break
                }
            }
            value = value >> 1
        }
        return result
    }
}
