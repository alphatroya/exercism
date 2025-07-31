enum BinarySearchError: Error {
    case unsorted
}

struct BinarySearch {
    let list: [Int]

    var middle: Int {
        list.count / 2
    }

    init(_ list: [Int]) throws {
        guard list == list.sorted() else {
            throw BinarySearchError.unsorted
        }
        self.list = list
    }

    func searchFor(_ number: Int) -> Int? {
        guard !list.isEmpty else {
            return nil
        }
        let half: [Int]
        let additionalOffset: Int
        switch list[middle] {
        case number:
            return middle
        case 0 ..< number:
            let lowerBound = middle + 1
            half = Array(list[lowerBound ..< list.count])
            additionalOffset = lowerBound
        default:
            half = Array(list[0 ..< middle])
            additionalOffset = 0
        }
        guard let newSearch = try? BinarySearch(half),
            let search = newSearch.searchFor(number) else {
            return nil
        }
        return additionalOffset + search
    }
}
