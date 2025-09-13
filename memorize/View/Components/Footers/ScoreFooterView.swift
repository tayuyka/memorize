import SwiftUI

struct ScoreFooterView: View {
    @ObservedObject var viewModel: GameViewModel

    var body: some View {
        FooterContainer {
            HStack(spacing: 12) {
                ScoreBadge(score: viewModel.score)
                                    .foregroundStyle(.white)
                                    .minimumScaleFactor(0.85)

                Spacer()
                
                Button("Перемешать") { viewModel.shuffle() }
                    .foregroundStyle(.white)
                    .bold(true)

               Spacer()

                Button("Новая игра") {
                    viewModel.newGame()
                }
                .foregroundStyle(.white)
                .bold(true)
            }
        }
    }
}
