import SwiftUI

struct CardView: View {
    let card: GameViewModel.Card
    let theme: Theme

    var body: some View {
        let style = theme.cardStyle
        let shape = RoundedRectangle(cornerRadius: style.corner, style: .continuous)

        ZStack {
            if card.isFaceUp {
                shape
                    .fill(.ultraThinMaterial)
                    .background(shape.fill(Color.white.opacity(style.frontBackgroundOpacity)))
                    .overlay(shape.stroke(.white.opacity(style.strokeOpacity), lineWidth: style.strokeWidth))
                    .overlay(
                        shape.stroke(
                            LinearGradient(
                                colors: [.white.opacity(0.45), .white.opacity(0.08), .clear],
                                startPoint: .top, endPoint: .bottom
                            ),
                            lineWidth: 0.9
                        )
                        .blendMode(.plusLighter)
                    )
                    .contentShape(Rectangle())
                
                Text(card.content)
                    .font(.system(size: 40))
            } else {
                shape
                    .fill(.ultraThinMaterial)
                    .background(shape.fill(theme.cardBack.opacity(style.backBackgroundOpacity)))
                    .overlay(shape.stroke(.white.opacity(style.strokeOpacity), lineWidth: style.strokeWidth))
                    .overlay(
                        shape.stroke(
                            LinearGradient(
                                colors: [.white.opacity(0.45), .white.opacity(0.08), .clear],
                                startPoint: .top, endPoint: .bottom
                            ),
                            lineWidth: 0.9
                        )
                        .blendMode(.plusLighter)
                    )
                    .contentShape(Rectangle())
            }
        }
        .animation(nil, value: card.isFaceUp)
    }
}
