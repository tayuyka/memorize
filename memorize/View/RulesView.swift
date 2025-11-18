import SwiftUI

struct RulesView: View {
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                rulesSection
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

private extension RulesView {
    var rulesSection: some View {
        SectionContainer("Правила игры") {
            VStack(alignment: .leading, spacing: 10) {
                Text("• Открывай по две карты.")
                Text("• Если эмодзи совпали — пара засчитывается (+2 балл).")
                Text("• Если не совпали — попробуй ещё раз (-1 балл).")
                Text("• Можешь использовать подсказку — все карты перевернутся на 2 секунды (-5 баллов).")
            }
            .foregroundStyle(.white)
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    RulesView()
        .previewInNav()
        .previewWithTheme()
}
