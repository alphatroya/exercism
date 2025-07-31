struct Triangle {
    let a, b, c: Double

    init(_ a: Double, _ b: Double, _ c: Double) {
        self.a = a
        self.b = b
        self.c = c
    }

    var kind: String {
        guard (a + b > c) && (b + c > a) else {
            return "ErrorKind"
        }

        switch true {
        case a == b && b == c:
            return "Equilateral"
        case a == b, c == b, c == a:
            return "Isosceles"
        default:
            return "Scalene"
        }
    }
}