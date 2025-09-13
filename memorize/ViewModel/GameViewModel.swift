import Foundation

final class GameViewModel: ObservableObject {
    typealias Card = Game<String>.Card

    @Published private(set) var model: Game<String>
    private(set) var theme: Theme
    
    @Published var showAllCardsTemporarily = false
    
    @Published private(set) var hintUsed = false
       var hintAvailable: Bool { !hintUsed }

       func useHint() {
           guard !hintUsed else { return }
           hintUsed = true
           revealAllCardsForOneSecond()
           model.applyHintPenalty()
       }

    init(theme: Theme, pairs: Int? = nil) {
        self.theme = theme
        self.model = Self.makeGame(from: theme, pairs: pairs)
    }

    private static func makeGame(from theme: Theme, pairs: Int?) -> Game<String> {
        let pairsCount = pairs ?? Int.random(in: 2...5)
        let chosen = Array(theme.emojis.shuffled().prefix(pairsCount))
        return Game<String>(numberOfPairsOfCards: pairsCount) { index in chosen[index] }
    }
    
    private func revealAllCardsForOneSecond() {
        showAllCardsTemporarily = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.showAllCardsTemporarily = false
        }
    }

    var cards: [Card] { model.cards }
    var score: Int { model.score }

    func choose(_ card: Card) { model.choose(card) }
    func shuffle() { model.shuffle() }

    func newGame(pairs: GamePairs) {
        hintUsed = false
        showAllCardsTemporarily = false
        model = Self.makeGame(from: theme, pairs: pairs.pairCount)
    }
}
