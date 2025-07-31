final class HelloWorld {
    static func hello(_ name: String? = nil) -> String {
        if let name = name {
            return "Hello, \(name)!"
        } else {
            return "Hello, World!"
        }
    }
}
