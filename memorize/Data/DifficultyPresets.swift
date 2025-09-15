import SwiftUI

struct GamePairs: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let pairCount: Int
    let caption: String

    static let easy = GamePairs(title: "Лёгкая", pairCount: 8, caption: "8 пар")
    static let medium = GamePairs(title: "Средняя", pairCount: 12, caption: "12 пар")
    static let hard = GamePairs(title: "Сложная", pairCount: 24, caption: "24 пары")

    static let all: [GamePairs] = [.easy, .medium, .hard]
}
