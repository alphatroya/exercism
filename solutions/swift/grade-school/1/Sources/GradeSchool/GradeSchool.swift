struct GradeSchool {
    var roster: [Int: [String]] = [:]

    var sortedRoster: [Int: [String]] {
        roster.mapValues { $0.sorted() }
    }

    func studentsInGrade(_ grade: Int) -> [String] {
        roster[grade] ?? []
    }

    mutating func addStudent(_ name: String, grade: Int) {
        if var array = roster[grade] {
            array.append(name)
            roster[grade] = array
        } else {
            roster[grade] = [name]
        }
    }
}
