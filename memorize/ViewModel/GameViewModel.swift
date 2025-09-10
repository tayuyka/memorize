import Foundation

final class GameViewModel: ObservableObject {
    typealias Card = Game<String>.Card

    @Published private var model: Game<String>

    init() {
        self.model = GameViewModel.makeGame()
    }

    // Базовый набор эмодзи (можно расширять/менять темами позже)
    private static let allEmojis = [
        "🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼",
        "🐨","🐯","🦁","🐮","🐷","🐸","🐵","🐔"
    ]

    private static func makeGame(pairs: Int = Int.random(in: 2...5)) -> Game<String> {
        let chosen = Array(allEmojis.shuffled().prefix(pairs))
        return Game<String>(numberOfPairsOfCards: pairs) { index in chosen[index] }
    }

    // MARK: - API для View
    var cards: [Card] { model.cards }

    func choose(_ card: Card) { model.choose(card) }
    func shuffle() { model.shuffle() }
    func newGame() { model = GameViewModel.makeGame() }
}
