import SwiftUI

final class ThemeManager: ObservableObject {
    @Published private(set) var current: Theme
    private let repo: ThemeRepository

    var allThemes: [Theme] { repo.all }

    init(repo: ThemeRepository = InMemoryThemeRepository(),
         initial: Theme? = nil) {
        self.repo = repo
        self.current = initial ?? repo.random()
    }

    func set(_ theme: Theme) { current = theme }
    func setRandom() { current = repo.random() }
}
