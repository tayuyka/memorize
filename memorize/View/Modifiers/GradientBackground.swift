import SwiftUI

private struct GradientNavBackground: ViewModifier {
    let colors: [Color]
    let start: UnitPoint
    let end: UnitPoint

    func body(content: Content) -> some View {
        ZStack {
            LinearGradient(colors: colors, startPoint: start, endPoint: end)
                .ignoresSafeArea()
            content
        }
        .toolbarBackground(.clear, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

extension View {
    func themedBackground(_ colors: [Color],
                          start: UnitPoint = .topLeading,
                          end: UnitPoint = .bottomTrailing) -> some View {
        self.modifier(GradientNavBackground(colors: colors, start: start, end: end))
    }
}
