import Foundation

struct Game<CardContent: Equatable> {
    private(set) var cards: [Card]
    private(set) var score: Int = 0

    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            let faceUp = cards.indices.filter { cards[$0].isFaceUp && !cards[$0].isMatched }
            return faceUp.count == 1 ? faceUp.first : nil
        }
        set {
            for i in cards.indices {
                cards[i].isFaceUp = (i == newValue)
            }
        }
    }

    mutating func choose(_ card: Card) {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else { return }
        guard !cards[index].isFaceUp, !cards[index].isMatched else { return }

        if let matchIndex = indexOfTheOneAndOnlyFaceUpCard, matchIndex != index {
            let isMatch = cards[matchIndex].content == cards[index].content
            if isMatch {
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
                score += 2
            } else {
                if cards[index].hasBeenSeen { score -= 1 }
                if cards[matchIndex].hasBeenSeen { score -= 1 }
                cards[index].hasBeenSeen = true
                cards[matchIndex].hasBeenSeen = true
            }
            cards[index].isFaceUp = true

        } else {
            indexOfTheOneAndOnlyFaceUpCard = index
        }
    }

    mutating func shuffle() { cards.shuffle() }
    
    mutating func applyHintPenalty() {
        score -= 5
    }

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
        var hasBeenSeen = false
        let content: CardContent
        let id: Int
    }
    
    var isFinished: Bool {
            cards.allSatisfy { $0.isMatched }
        }
}

private extension Array {
    var only: Element? { count == 1 ? first : nil }
}

