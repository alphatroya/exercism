private final class Node<T> {
    var value: T
    var next: Node<T>?
    var previous: Node<T>?

    init(
        value: T,
        next: Node<T>?,
        previous: Node<T>?
    ) {
        self.value = value
        self.next = next
        self.previous = previous
    }
}

final class Deque<T> {
    private var first: Node<T>?
    private var last: Node<T>?
}

extension Deque {
    func push(_ value: T) {
        if last == nil && first == nil {
            let node = Node(value: value, next: nil, previous: nil)
            self.last = node
            self.first = node
        } else {
            let next = Node(value: value, next: nil, previous: last)
            last?.next = next
            self.last = next
        }
    }

    func pop() -> T? {
        guard let last = self.last else {
            return nil
        }
        self.last = last.previous
        self.last?.next = nil
        return last.value
    }

    func unshift(_ value: T) {
        if last == nil && first == nil {
            let node = Node(value: value, next: nil, previous: nil)
            self.first = node
            self.last = node
        } else {
            let previous = Node(value: value, next: first, previous: nil)
            first?.previous = previous
            self.first = previous
        }
    }

    func shift() -> T? {
        guard let first = self.first else {
            return nil
        }
        self.first = first.next
        self.first?.previous = nil
        return first.value
    }
}
