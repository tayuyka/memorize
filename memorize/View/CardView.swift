import SwiftUI

struct CardView: View {
    let card: GameViewModel.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 12)
            if card.isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.system(size: 40))
            } else {
                shape.fill(.blue.gradient)
            }
        }
    }
}
