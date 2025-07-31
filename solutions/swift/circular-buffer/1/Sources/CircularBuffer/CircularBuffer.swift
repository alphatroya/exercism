enum CircularBufferError: Error {
    case bufferEmpty
    case bufferFull
}

struct CircularBuffer<T> {
    private var buffer = [T]()
    var capacity: Int

    init(capacity: Int) {
        self.capacity = capacity
    }

    mutating func write(_ value: T) throws {
        guard buffer.count != capacity else {
            throw CircularBufferError.bufferFull
        }
        buffer.append(value)
    }

    mutating func read() throws -> T {
        guard let first = buffer.first else {
            throw CircularBufferError.bufferEmpty
        }
        buffer = Array(buffer.dropFirst())
        return first
    }

    mutating func overwrite(_ value: T) {
        if buffer.count == capacity {
            _ = try? read()
        }
        try? write(value)
    }

    mutating func clear() {
        buffer.removeAll()
    }
}
