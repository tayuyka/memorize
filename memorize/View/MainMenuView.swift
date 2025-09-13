import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        VStack(spacing: 20) {
            Text("Memorize")
                .font(.largeTitle).bold()
                .padding(40)
                .foregroundStyle(.white)

            NavigationLink {
                GameView(viewModel: GameViewModel(theme: themeManager.current))
            } label: {
                GlassCapsule(systemImage: "play.circle.fill", title: "Играть", theme: themeManager.current)
            }
            
            NavigationLink {
                ThemesView()
            } label: {
                GlassCapsule(systemImage: "paintpalette.fill", title: "Тема", theme: themeManager.current)
            }
            
            NavigationLink {
                RulesView()
            } label: {
                GlassCapsule(systemImage: "book.pages.fill", title: "Правила",theme: themeManager.current)
            }

            Spacer()

        }
        .padding()
        .attachFooter { ThemeFooterView() }
        .themedBackground(themeManager.current.backgroundGradient)
        .glassNavBar(toolBarLabel: "Меню")
        
    }
}

#Preview {
    MainMenuView()
        .previewInNav()
        .previewWithTheme()
}

