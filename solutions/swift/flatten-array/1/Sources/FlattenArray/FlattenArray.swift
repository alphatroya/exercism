func flattenArray<T>(_ input: [Any]) -> [T] {
    return input.flatMap { (element: Any) -> [T] in
        switch element {
        case let single as T:
            return [single]
        case let innerArray as [Any]:
            return flattenArray(innerArray)
        default:
            return []
        }
    }
}
