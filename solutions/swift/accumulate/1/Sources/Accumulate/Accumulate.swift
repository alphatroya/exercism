extension Array {
    func accumulate<T>(_ modifier: (Element) -> T) -> [T] {
        map { modifier($0) }
    }
}
