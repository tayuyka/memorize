#if DEBUG
import SwiftUI

enum PreviewRepo {
    static let themes = InMemoryThemeRepository()
}

extension ThemeManager {
    static var preview: ThemeManager {
        ThemeManager(repo: PreviewRepo.themes,
                     initial: PreviewRepo.themes.all.first!)
    }
}

extension GameViewModel {
    static var preview: GameViewModel {
        GameViewModel(theme: PreviewRepo.themes.all.first!)
    }
}

extension View {
    func previewInNav() -> some View {
        NavigationStack { self }
    }

    func previewWithTheme() -> some View {
        self.environmentObject(ThemeManager.preview)
    }
}
#endif

