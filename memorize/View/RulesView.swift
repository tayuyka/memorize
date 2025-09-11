import SwiftUI

struct RulesView: View {
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text("Правила игры")
                    .font(.largeTitle).bold()
                Text("""
                • Открывай по две карты.
                • Если эмодзи совпали — пара засчитывается.
                • Если не совпали — попробуй ещё раз.
                """)
                .font(.body)
                .foregroundStyle(.secondary)
            }
            .padding()
            
        }
        .safeAreaInset(edge: .bottom) {
                ThemeFooterView()
                    .environmentObject(themeManager)
            }
        .scrollContentBackground(.hidden)
        .background(themeManager.current.background.ignoresSafeArea())
            .toolbarBackground(themeManager.current.background, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        .navigationTitle("Правила")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RulesView()
        .previewInNav()
        .previewWithTheme()
}
