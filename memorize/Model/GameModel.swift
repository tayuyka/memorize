import Foundation

struct Game<CardContent: Equatable> {
    private(set) var cards: [Card]

    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp && !cards[$0].isMatched }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }

    mutating func choose(_ card: Card) {
        if let index = cards.firstIndex(where: { $0.id == card.id }),
           !cards[index].isFaceUp,
           !cards[index].isMatched
        {
            if let matchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[matchIndex].content == cards[index].content {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = index
            }
        }
    }

    mutating func shuffle() { cards.shuffle() }

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }

    struct Card: Identifiable, Equatable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

private extension Array {
    var only: Element? { count == 1 ? first : nil }
}

