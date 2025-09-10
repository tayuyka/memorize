
import SwiftUI

@main
struct memorizeApp: App {
    var body: some Scene {
        WindowGroup {
            GameView(viewModel: GameViewModel())
        }
    }
}
