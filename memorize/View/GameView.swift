import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var themeManager: ThemeManager
    
    @State private var showDifficulty = false
    @State private var lastScore: Int = 0
    @State private var flashText: String? = nil
    @State private var flashPositive: Bool = true
    
    private let columns = [GridItem(.adaptive(minimum: 70), spacing: 12)]
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            ScrollView {
                gameGrid
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
                    showDifficulty = true
                } label: {
                    HStack(spacing: 6) {
                        Text("Новая игра")
                    }
                }
                .foregroundStyle(.white)
            }
        }
        .onAppear {
            lastScore = viewModel.score
        }
        .onChange(of: viewModel.score) { oldValue, newValue in
            scoreColculate(newValue: newValue, oldValue: oldValue)
            
        }
        .alert("Поздравляем! 🎉", isPresented: $viewModel.showGameOver) {
            alertButtons
        } message: {
            Text("Ваш счёт: \(viewModel.score) из \(viewModel.totalCards)")
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

private extension GameView{
    var gameGrid: some View{
        FittingGrid(
            itemCount: viewModel.cards.count,
            spacing: 12,
            horizontalPadding: 0,
            aspectRatio: 2/3,
            baseMinWidth: 70
        ) { idx, cellW in
            let card = viewModel.cards[idx]
            CardView(card: card,
                     theme: viewModel.theme,
                     showAll: viewModel.showAllCardsTemporarily)
            .onTapGesture { viewModel.choose(card) }
            .opacity(card.isMatched ? 0 : 1)
            .animation(.easeInOut, value: viewModel.cards)
        }
    }
    
    var alertButtons: some View{
        Group{
            Button("Новая игра") {
                showDifficulty = true
            }
            Button("В меню", role: .cancel) {
                dismiss()
            }
        }
    }
    
    func scoreColculate(newValue: Int, oldValue: Int){
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
}
