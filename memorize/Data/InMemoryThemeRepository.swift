import SwiftUI

struct InMemoryThemeRepository: ThemeRepository {
    let all: [Theme] = [
        Theme(name: "Животные",
              emojis: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮"],
              background: Color(.sRGB, red: 0.96, green: 0.98, blue: 1.00, opacity: 1),
              cardBack: Color.blue.opacity(0.75),
              accent: .blue,
              arcFraction: 0.25),
        Theme(name: "Еда",
              emojis: ["🍎","🍊","🍋","🍉","🍇","🍓","🍒","🥝","🍍","🥑","🌶️","🥐"],
              background: Color(.sRGB, red: 1.00, green: 0.98, blue: 0.95, opacity: 1),
              cardBack: Color.orange.opacity(0.8),
              accent: .orange,
              arcFraction: 0.33),
        Theme(name: "Эмоции",
              emojis: ["😀","😅","😂","🥲","😍","🤓","😎","🤩","😡","😱","😴","🤠"],
              background: Color(.sRGB, red: 0.97, green: 1.00, blue: 0.97, opacity: 1),
              cardBack: Color.green.opacity(0.75),
              accent: .green,
              arcFraction: 0.4),
    ]

    func random() -> Theme { all.randomElement() ?? all[0] }
}
