import SwiftUI

struct ThemesView: View {
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                SectionContainer("Выберите тему") {
                    ForEach(themeManager.allThemes) { theme in
                        ThemeRow(theme: theme) { themeManager.set(theme) }
                        if theme.id != themeManager.allThemes.last?.id {
                            Divider().overlay(.white)
                        }
                    }
                }

                SectionContainer {
                    Button {
                        themeManager.setRandom()
                    } label: {
                        HStack(spacing: 8) {
                            Image(systemName: "shuffle")
                            Text("Случайная тема").bold()
                            Spacer()
                        }
                        .padding(.vertical, 6)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
            .padding(.bottom, 24)
        }
        .themedBackground(themeManager.current.backgroundGradient)
        .toolbarBackground(.hidden, for: .navigationBar)
        .glassNavBar(toolBarLabel: "Тема")
    }
}
