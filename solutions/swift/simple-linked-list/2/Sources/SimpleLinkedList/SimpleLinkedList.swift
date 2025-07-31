final class Element<T> {
    var value: T?
    var next: Element<T>?

    init(_ value: T? = nil, _ next: Element<T>? = nil) {
        self.value = value
        self.next = next
    }

    static func fromArray(_ array: [T]) -> Element<T> {
        return Element.fromReversedArray(Array(array.reversed()))
    }

    private static func fromReversedArray(_ array: [T]) -> Element<T> {
        var reversed = array
        guard let value = reversed.popLast() else {
            return Element()
        }
        return Element(value, fromReversedArray(reversed))
    }

    func toArray() -> [T] {
        guard let value = self.value else {
            return []
        }
        let result = [value]
        guard let next = self.next else {
            return result
        }
        return result + next.toArray()
    }

    func reverseElements() -> Element<T> {
        guard let next = self.next else {
            return Element(value, nil)
        }
        let reversedNext = next.reverseElements()
        reversedNext.next = self
        return reversedNext
    }
}
