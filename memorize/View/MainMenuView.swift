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
                Text("Memorize")
                    .font(titleFont)
                    .foregroundStyle(.white)
                    .padding(.top, titleTop)
                    .padding(.bottom, titleBottom)
                    .padding(.horizontal, 18)
                    .minimumScaleFactor(0.7)

                Button { showDifficulty = true } label: {
                    GlassCapsule(systemImage: "play.circle.fill",
                                 title: "Играть",
                                 theme: themeManager.current)
                }

                NavigationLink {
                    ThemesView()
                } label: {
                    GlassCapsule(systemImage: "paintpalette.fill",
                                 title: "Тема",
                                 theme: themeManager.current)
                }

                NavigationLink {
                    RulesView()
                } label: {
                    GlassCapsule(systemImage: "book.pages.fill",
                                 title: "Правила",
                                 theme: themeManager.current)
                }

                Spacer(minLength: 0)
            }
            .padding(.horizontal, hPadding)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .glassNavBar(toolBarLabel: "Меню")

        .safeAreaInset(edge: .bottom) {
            ThemeFooterView()
                .environmentObject(themeManager)
        }

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
            .ignoresSafeArea()
            .zIndex(10)
        )
    }
}


#Preview {
    MainMenuView()
        .previewInNav()
        .previewWithTheme()
}

