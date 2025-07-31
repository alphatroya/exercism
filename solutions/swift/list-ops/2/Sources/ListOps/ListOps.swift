enum ListOps {
    static func append<T>(_ a: [T], _ b: [T]) -> [T] {
        return a + b
    }

    static func concat<T>(_ array: [T]...) -> [T] {
        return array.reduce([T]()) { $0 + $1 }
    }

    static func filter<T>(_ array: [T], _ filter: (T) -> Bool) -> [T] {
        var newArray = [T]()
        for element in array where filter(element) {
            newArray.append(element)
        }
        return newArray
    }

    static func length<T>(_ array: [T]) -> Int {
        var count = 0
        for _ in array {
            count += 1
        }
        return count
    }

    static func map<T, A>(_ array: [T], _ mapClosure: (T) -> A) -> [A] {
        var newArray = [A]()
        for element in array {
            newArray.append(mapClosure(element))
        }
        return newArray
    }

    static func foldLeft<T>(_ array: Array<T>, accumulated: T, combine: ((T, T) -> T)) -> T {
        var result: T = accumulated
        for element in array {
            result = combine(result, element)
        }
        return result
    }

    static func reverse<T>(_ input: [T]) -> [T] {
        var result = [T]()
        var input = input
        while true {
            guard let last = input.popLast() else {
                break
            }
            result.append(last)
        }
        return result
    }

    static func foldRight<T>(_ array: Array<T>, accumulated: T, combine: ((T, T) -> T)) -> T {
        return foldLeft(reverse(array), accumulated: accumulated, combine: { combine($1, $0) })
    }
}
