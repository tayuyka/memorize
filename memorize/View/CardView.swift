import SwiftUI

struct CardView: View {
    let card: GameViewModel.Card
    let backColor: Color

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 12)
            if card.isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.system(size: 40))
            } else {
                shape.fill(backColor)
            }
        }
    }
}

#Preview {
    CardView(
        card: .init(isFaceUp: true, isMatched: false, content: "🐶", id: 1),
        backColor: .blue
    )
    .frame(width: 100, height: 150)
}
