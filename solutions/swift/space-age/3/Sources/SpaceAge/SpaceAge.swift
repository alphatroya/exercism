import Foundation

struct SpaceAge {
    let seconds: TimeInterval
    let onEarth: Double
    let onMercury: Double
    let onVenus: Double
    let onMars: Double
    let onJupiter: Double
    let onSaturn: Double
    let onUranus: Double
    let onNeptune: Double

    init(_ seconds: TimeInterval) {
        self.seconds = seconds
        onEarth = seconds / 31_557_600
        onMercury = onEarth / 0.2408467
        onVenus = onEarth / 0.61519726
        onMars = onEarth / 1.8808158
        onJupiter = onEarth / 11.862615
        onSaturn = onEarth / 29.447498
        onUranus = onEarth / 84.016846
        onNeptune = onEarth / 164.79132
    }
}
