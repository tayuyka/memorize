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
                    .lineLimit(1)

                Spacer()

                Button("Подсказка") { viewModel.useHint() }
                    .foregroundStyle(.white)
                    .disabled(!viewModel.hintAvailable)
                    .opacity(viewModel.hintAvailable ? 1 : 0.4)
                    .bold(true)
                    .lineLimit(1)
            }
        }
    }
}
