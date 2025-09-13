import SwiftUI

struct ScoreFooterView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    @ObservedObject var viewModel: GameViewModel
    @State private var showDifficulty = false

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

                Button("Новая игра") { showDifficulty = true }
                    .foregroundStyle(.white)
                    .bold(true)
            }
        }
        .overlay(
            GlassBottomSheet(isPresented: $showDifficulty) {
                DifficultyPickerSheet { pairs in
                    viewModel.newGame(pairs: pairs)
                    showDifficulty = false
                }
            }
            .environmentObject(themeManager)
        )
    }
}
