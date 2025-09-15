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
    /// Оборачивает в NavigationStack (часто нужно для тулбара/титула)
    func previewInNav() -> some View {
        NavigationStack { self }
    }

    /// Подкладывает ThemeManager.preview как EnvironmentObject
    func previewWithTheme() -> some View {
        self.environmentObject(ThemeManager.preview)
    }
}
#endif

