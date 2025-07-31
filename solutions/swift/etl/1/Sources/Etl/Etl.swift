
enum ETL {
    typealias Result = [String: Int]
    typealias Source = [Int: [String]]
    static func transform(_ old: Source) -> Result {
        return old.reduce(Result()) { (result: Result, element: (key: Int, value: [String])) in
            var result = result
            element.value.forEach {
                result[$0.lowercased()] = element.key
            }
            return result
        }
    }
}
