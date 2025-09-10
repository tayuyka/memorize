import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel

    private let columns = [GridItem(.adaptive(minimum: 70), spacing: 12)]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture { viewModel.choose(card) }
                            .opacity(card.isMatched ? 0 : 1)
                            .animation(.easeInOut, value: viewModel.cards)
                    }
                }
                .padding()
            }
            .navigationTitle("Memorize")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Shuffle") { viewModel.shuffle() }
                    Button("New Game") { viewModel.newGame() }
                }
            }
        }
    }
}
#Preview {
    GameView(viewModel: GameViewModel())
}
