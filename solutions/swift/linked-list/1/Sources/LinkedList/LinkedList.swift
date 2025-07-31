final class Deque<T> {
    private var queue: [T] = []
}

extension Deque {
    func push(_ value: T) {
        queue.append(value)
    }

    func pop() -> T? {
        return queue.popLast()
    }

    func shift() -> T? {
        guard let first = self.queue.first else {
            return nil
        }
        queue = Array(queue.dropFirst())
        return first
    }

    func unshift(_ value: T) {
        queue.insert(value, at: 0)
    }
}
