import SwiftUI

struct ThemesView: View {
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        List {
            Section("Выберите тему") {
                ForEach(themeManager.allThemes) { theme in
                    Button {
                        themeManager.set(theme)
                    } label: {
                        HStack {
                            ThemeArc(color: theme.accent, fraction: theme.arcFraction)
                                .frame(width: 28, height: 28)
                            Text(theme.name).bold()
                            Spacer()
                            ColorSwatch(color: theme.cardBack)
                            ColorSwatch(color: theme.background)
                        }
                    }
                }
            }
            Section {
                Button {
                    themeManager.setRandom()
                } label: {
                    Label("Случайная тема", systemImage: "shuffle")
                }
            }
        }
        .scrollContentBackground(.hidden)
                .background(themeManager.current.background.ignoresSafeArea())
                .toolbarBackground(themeManager.current.background, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
        .navigationTitle("Тема")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct ColorSwatch: View {
    let color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(color)
            .frame(width: 20, height: 20)
            .overlay(RoundedRectangle(cornerRadius: 6).stroke(.secondary.opacity(0.3)))
    }
}

private struct ThemeArc: View {
    let color: Color
    let fraction: CGFloat
    var body: some View {
        Circle()
            .trim(from: 0, to: min(max(fraction, 0), 1))
            .stroke(color, style: StrokeStyle(lineWidth: 4, lineCap: .round))
            .rotationEffect(.degrees(-90))
    }
}

#Preview {
    ThemesView()
        .previewInNav()
        .previewWithTheme()
}

