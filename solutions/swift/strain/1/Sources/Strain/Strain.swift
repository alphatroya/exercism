extension Array {
    func keep(_ predicate: (Element) -> Bool) -> [Element] {
        filter(predicate)
    }

    func discard(_ predicate: (Element) -> Bool) -> [Element] {
        filter { !predicate($0) }
    }
}
