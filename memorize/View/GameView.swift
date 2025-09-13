import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var themeManager: ThemeManager
    @State private var showDifficulty = false

    private let columns = [GridItem(.adaptive(minimum: 70), spacing: 12)]

    @State private var lastScore: Int = 0
    @State private var flashText: String? = nil
    @State private var flashPositive: Bool = true

    var body: some View {
        ZStack(alignment: .topTrailing) {

            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card, theme: viewModel.theme, showAll: viewModel.showAllCardsTemporarily)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                            .opacity(card.isMatched ? 0 : 1)
                            .animation(.easeInOut, value: viewModel.cards)
                    }
                }
                .padding()
            }
            
            if let text = flashText {
                ScoreFlashLayer(text: text, isPositive: flashPositive)
            }

        }
        .attachFooter {
            ScoreFooterView(viewModel: viewModel)
        }
        .themedBackground(themeManager.current.backgroundGradient)
        .glassNavBar(toolBarLabel: viewModel.theme.name)
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button {
                    viewModel.useHint()
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "lightbulb")
                        Text("Подсказка")
                    }
                }
                .disabled(!viewModel.hintAvailable)
                .opacity(viewModel.hintAvailable ? 1 : 0.4)
                .foregroundStyle(.white)
            }
        }
        .onAppear {
            lastScore = viewModel.score
        }
        .onChange(of: viewModel.score) { oldValue, newValue in
            let delta = newValue - oldValue
            guard delta != 0 else { return } 

            switch delta {
            case 2:
                flashText = "+2"
                flashPositive = true
            case -5:
                flashText = "-5"
                flashPositive = false
            case ..<0:
                flashText = "-1"
                flashPositive = false
            default:
                return
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                flashText = nil
            }
        }
        .alert("Поздравляем! 🎉", isPresented: $viewModel.showGameOver) {
                    Button("Новая игра") {
                        showDifficulty = true
                    }
                    Button("В меню", role: .cancel) {
                        dismiss()
                    }
                } message: {
                    Text("Ваш счёт: \(viewModel.score)")
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
