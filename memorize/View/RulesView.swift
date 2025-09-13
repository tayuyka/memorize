import SwiftUI

struct RulesView: View {
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                SectionContainer("Правила игры") {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("• Открывай по две карты.")
                        Text("• Если эмодзи совпали — пара засчитывается.")
                        Text("• Если не совпали — попробуй ещё раз.")
                    }
                    .padding(.vertical, 12)
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(.top, 12)
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
        }
        .themedBackground(themeManager.current.backgroundGradient)
        .glassNavBar(toolBarLabel: "Правила")
        .attachFooter { ThemeFooterView() }
    }
}

#Preview {
    RulesView()
        .previewInNav()
        .previewWithTheme()
}
