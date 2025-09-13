import SwiftUI

struct InMemoryThemeRepository: ThemeRepository {
    let all: [Theme] = [
        Theme(
            name: "Животные",
            emojis: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮"],
            backgroundGradient: [
                Color(hue: 0.75, saturation: 0.5, brightness: 0.55),
                Color(hue: 0.63, saturation: 0.6, brightness: 0.6)
            ],
            cardBack: Color.purple.opacity(0.7),
            accent: .blue,
            arcFraction: 0.25
        ),
        Theme(
            name: "Еда",
            emojis: ["🍎","🍊","🍋","🍉","🍇","🍓","🍒","🥝","🍍","🥑","🌶️","🥐"],
            backgroundGradient: [
                Color(red: 0.7, green: 0.4, blue: 0.15),
                Color(red: 1, green: 0.6, blue: 0)
            ],
            cardBack: Color.orange.opacity(0.8),
            accent: .orange,
            arcFraction: 0.33
        ),
        Theme(
            name: "Эмоции",
            emojis: ["😀","😅","😂","🥲","😍","🤓","😎","🤩","😡","😱","😴","🤠"],
            backgroundGradient: [
                Color(hue: 0.40, saturation: 0.65, brightness: 0.55),
                Color(hue: 0.55, saturation: 0.55, brightness: 0.55)
            ],
            cardBack: Color.green.opacity(0.75),
            accent: .green,
            arcFraction: 0.4
        )
    ]

    func random() -> Theme { all.randomElement() ?? all[0] }
}
