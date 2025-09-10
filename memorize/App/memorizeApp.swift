
import SwiftUI

@main
struct memorizeApp: App {
    @StateObject private var themeManager = ThemeManager(repo: InMemoryThemeRepository())

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainMenuView()
            }
            .environmentObject(themeManager)
        }
    }
}
