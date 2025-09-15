import Foundation

protocol ThemeRepository {
    var all: [Theme] { get }
    func random() -> Theme
}

