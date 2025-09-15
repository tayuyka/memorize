import SwiftUI

struct InMemoryThemeRepository: ThemeRepository {
    let all: [Theme] = [
        Theme(
            name: "Животные",
            emojis: [
                "🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮",
                "🐷","🐸","🐵","🐔","🐧","🐦","🐤","🦆","🦅","🦉","🦇","🐢"
            ],
            backgroundGradient: [
                Color(hue: 0.65, saturation: 0.65, brightness: 0.55),
                Color(hue: 0.80, saturation: 0.55, brightness: 0.65)
            ],
            cardBack: Color.purple.opacity(0.7),
            accent: .blue,
            arcFraction: 0.25
        ),
        Theme(
            name: "Еда",
            emojis: [
                "🍎","🍊","🍋","🍉","🍇","🍓","🍒","🥝","🍍","🥑","🌶️","🥐",
                "🍌","🥭","🍑","🍈","🍏","🥥","🥒","🥦","🥬","🥕","🥔","🌽"
            ],
            backgroundGradient: [
               Color(hue: 0.0, saturation: 0.75, brightness: 0.65),
               Color(hue: 0.08, saturation: 0.8, brightness: 0.9)
           ],
            cardBack: Color.orange.opacity(0.8),
            accent: .orange,
            arcFraction: 0.33
        ),
        Theme(
            name: "Эмоции",
            emojis: [
                "🍎","🍊","🍋","🍉","🍇","🍓","🍒","🥝","🍍","🥑","🌶️","🥐",
                "🍌","🥭","🍑","🍈","🍏","🥥","🥒","🥦","🥬","🥕","🥔","🌽"
            ],
            backgroundGradient: [
                Color(hue: 0.33, saturation: 0.7, brightness: 0.25),
                Color(hue: 0.33, saturation: 0.6, brightness: 0.6)
            ],
            cardBack: Color.green.opacity(0.75),
            accent: .green,
            arcFraction: 0.4
        )
    ]

    func random() -> Theme { all.randomElement() ?? all[0] }
}
