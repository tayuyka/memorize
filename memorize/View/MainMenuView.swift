import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    @State private var showDifficulty = false
    @State private var route: GameRoute? = nil

    var body: some View {
        VStack(spacing: 20) {
            Text("Memorize")
                .font(.largeTitle).bold()
                .padding(40)
                .foregroundStyle(.white)

            Button {
                showDifficulty = true
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
        .navigationDestination(item: $route) { route in
            let vm = GameViewModel(theme: themeManager.current,
                                   pairs: route.pairs.pairCount)
            GameView(viewModel: vm)
        }

        .overlay(
            GlassBottomSheet(isPresented: $showDifficulty) {
                DifficultyPickerSheet { pairs in
                    route = GameRoute(pairs: pairs)
                    showDifficulty = false
                }
            }
        )
    }
}

#Preview {
    MainMenuView()
        .previewInNav()
        .previewWithTheme()
}

