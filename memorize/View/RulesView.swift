import SwiftUI

struct RulesView: View {
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
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Правила")
        .navigationBarTitleDisplayMode(.inline)
    }
}
