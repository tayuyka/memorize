import SwiftUI

struct GameRoute: Identifiable, Hashable {
    let id = UUID()
    let pairs: GamePairs
}
