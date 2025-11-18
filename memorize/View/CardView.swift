import SwiftUI

struct CardView: View {
    let card: GameViewModel.Card
    let theme: Theme
    let showAll: Bool
    let style: CardStyle
    
    init(card: GameViewModel.Card, theme: Theme, showAll: Bool) {
        self.card = card
        self.theme = theme
        self.showAll = showAll
        self.style = theme.cardStyle

    }
    var body: some View {
        ZStack {
            shape
                .fill(.ultraThinMaterial)
                .background(
                    cardBackground
                )
                .overlay(shape.stroke(.white.opacity(style.strokeOpacity), lineWidth: style.strokeWidth))
                .overlay(
                    cardStroke
                )
                .contentShape(Rectangle())
            
            if card.isFaceUp || showAll {
                Text(card.content)
                    .font(.system(size: 40))
                    .animation(nil, value: card.isFaceUp)
            }
        }
    }
}

private extension CardView {
    var shape: RoundedRectangle {
        RoundedRectangle(cornerRadius: style.corner, style: .continuous)
    }
    
    var cardBackground: some View {
        shape.fill(
            (card.isFaceUp || showAll) ? Color.white.opacity(
                style.frontBackgroundOpacity) : theme.cardBack.opacity(style.backBackgroundOpacity)
        )
    }
    
    var cardStroke: some View {
        shape.stroke(
            LinearGradient(
                colors: [.white.opacity(0.45), .white.opacity(0.08), .clear],
                startPoint: .top, endPoint: .bottom
            ),
            lineWidth: 0.9
        )
        .blendMode(.plusLighter)
    }
}
