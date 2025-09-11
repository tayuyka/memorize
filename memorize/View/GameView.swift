import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var themeManager: ThemeManager


    private let columns = [GridItem(.adaptive(minimum: 70), spacing: 12)]

    var body: some View {
        ZStack(alignment: .topTrailing) {
            viewModel.theme.background.ignoresSafeArea()

            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card, backColor: viewModel.theme.cardBack)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture { viewModel.choose(card) }
                            .opacity(card.isMatched ? 0 : 1)
                            .animation(.easeInOut, value: viewModel.cards)
                    }
                }
                .padding()
            }
        }
        .navigationTitle(Text(viewModel.theme.name))
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button("Shuffle") { viewModel.shuffle() }
            }
        }
    }
}

private struct ThemeArc: View {
    let color: Color
    let fraction: CGFloat
    var body: some View {
        Circle()
            .trim(from: 0, to: min(max(fraction, 0), 1))
            .stroke(color, style: StrokeStyle(lineWidth: 3, lineCap: .round))
            .rotationEffect(.degrees(-90))
    }
}


#Preview {
    GameView(viewModel: .preview)
        .previewInNav()
}

