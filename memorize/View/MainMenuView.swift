import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    @Environment(\.verticalSizeClass) private var vSize

    @State private var showDifficulty = false
    @State private var route: GameRoute? = nil

    private var isLandscape: Bool { vSize == .compact }
    private var titleFont: Font { .system(size: isLandscape ? 44 : 64, weight: .black) }
    private var titleTop: CGFloat { isLandscape ? 16 : 42 }
    private var titleBottom: CGFloat { isLandscape ? 8 : 18 }
    private var vSpacing: CGFloat { isLandscape ? 14 : 20 }
    private var hPadding: CGFloat { isLandscape ? 16 : 24 }

    var body: some View {
        ZStack {
            Color.clear
                .themedBackground(themeManager.current.backgroundGradient)
                .ignoresSafeArea()

            VStack(spacing: vSpacing) {
                title
                startGameButton
                themeButton
                rulesButton
            }
            .padding(.horizontal, hPadding)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .glassNavBar(toolBarLabel: "Меню")
        .safeAreaInset(edge: .bottom) {
            ThemeFooterView()
                .environmentObject(themeManager)
        }
        .overlay(
            GlassBottomSheet(isPresented: $showDifficulty) {
                DifficultyPickerSheet { pairs in
                    route = GameRoute(pairs: pairs)
                    showDifficulty = false
                }
            }
            .ignoresSafeArea()
            .zIndex(10)
        )
        .navigationDestination(item: $route) { route in
            let vm = GameViewModel(theme: themeManager.current,
                                   pairs: route.pairs.pairCount)
            GameView(viewModel: vm)
        }
    }
}

// MARK: - layout

private extension MainMenuView {

    var title: some View {
        Text("Memorize")
            .font(titleFont)
            .foregroundStyle(.white)
            .padding(.top, titleTop)
            .padding(.bottom, titleBottom)
            .padding(.horizontal, 12)
            .minimumScaleFactor(0.7)
    }
    
    var startGameButton: some View {
        Button { showDifficulty = true } label: {
            GlassCapsule(systemImage: "play.circle.fill",
                         title: "Играть",
                         theme: themeManager.current)
        }
    }
    
    var themeButton: some View {
        NavigationLink {
            ThemesView()
        } label: {
            GlassCapsule(systemImage: "paintpalette.fill",
                         title: "Тема",
                         theme: themeManager.current)
        }
    }
    
    var rulesButton: some View {
        NavigationLink {
            RulesView()
        } label: {
            GlassCapsule(systemImage: "book.pages.fill",
                         title: "Правила",
                         theme: themeManager.current)
        }
    }
    
}

#Preview {
    MainMenuView()
        .previewInNav()
        .previewWithTheme()
}

