
import SwiftUI

struct MainMenuView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Memorize")
                .font(.largeTitle).bold()
                .padding(.top, 40)

            NavigationLink {
                GameView(viewModel: GameViewModel())
            } label: {
                Label("Новая игра", systemImage: "play.circle.fill")
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.blue.gradient)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }

            NavigationLink {
                ThemesView()
            } label: {
                Label("Тема", systemImage: "paintpalette.fill")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.secondary.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }

            NavigationLink {
                RulesView()
            } label: {
                Label("Правила", systemImage: "book.pages.fill")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.secondary.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Меню")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    NavigationStack {
        MainMenuView()
    }
}
