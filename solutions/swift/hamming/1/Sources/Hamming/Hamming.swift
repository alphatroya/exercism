func compute(_ first: String, against second: String) -> Int? {
    guard first.endIndex == second.endIndex else {
        return nil
    }

    return zip(first, second)
        .filter { $0 != $1 }
        .count
}