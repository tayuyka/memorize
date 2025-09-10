import SwiftUI

struct ThemesView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Темы")
                .font(.largeTitle).bold()
            Text("Экран выбора темы (в разработке).")
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding()
        .navigationTitle("Тема")
        .navigationBarTitleDisplayMode(.inline)
    }
}
