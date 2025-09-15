import SwiftUI

struct Theme: Identifiable, Hashable {
    let id: UUID
    let name: String
    let emojis: [String]
    let backgroundGradient: [Color]
    let cardBack: Color
    let accent: Color
    let arcFraction: CGFloat
    let cardStyle: CardStyle
    let sectionsStyle: SectionsStyle

    init(id: UUID = .init(),
         name: String,
         emojis: [String],
         backgroundGradient: [Color],
         cardBack: Color,
         accent: Color,
         arcFraction: CGFloat,
         cardStyle: CardStyle = .default,
         sectionsStyle: SectionsStyle = .default) {
        self.id = id
        self.name = name
        self.emojis = emojis
        self.backgroundGradient = backgroundGradient
        self.cardBack = cardBack
        self.accent = accent
        self.arcFraction = arcFraction
        self.cardStyle = cardStyle
        self.sectionsStyle = sectionsStyle
    }

    static func == (lhs: Theme, rhs: Theme) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
