enum Result {
    case equal, sublist, superlist, unequal
}

func classifier<T: Equatable>(listOne: [T], listTwo: [T]) -> Result {
    if listOne == listTwo {
        return .equal
    }
    if listTwo.contains(subarray: listOne) {
        return .sublist
    }
    if listOne.contains(subarray: listTwo) {
        return .superlist
    }
    return .unequal
}

private extension Array where Element: Equatable {
    func contains(subarray: [Element]) -> Bool {
        guard !subarray.isEmpty else {
            return true
        }
        for (index, element) in enumerated() {
            if element == subarray.first {
                for (subindex, subelement) in subarray.enumerated() {
                    let shiftedIndex = index + subindex
                    if !indices.contains(shiftedIndex) || self[shiftedIndex] != subelement {
                        break
                    }
                    if subindex == subarray.count - 1 {
                        return true
                    }
                }
            }
        }
        return false
    }
}
