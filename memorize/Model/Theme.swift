import SwiftUI

struct Theme: Identifiable, Hashable {
    let id: UUID
    let name: LocalizedStringKey
    let emojis: [String]
    let background: Color
    let cardBack: Color
    let accent: Color
    let arcFraction: CGFloat

    init(id: UUID = .init(),
         name: LocalizedStringKey,
         emojis: [String],
         background: Color,
         cardBack: Color,
         accent: Color,
         arcFraction: CGFloat) {
        self.id = id
        self.name = name
        self.emojis = emojis
        self.background = background
        self.cardBack = cardBack
        self.accent = accent
        self.arcFraction = arcFraction
    }

    static func == (lhs: Theme, rhs: Theme) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
