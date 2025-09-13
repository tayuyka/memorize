import SwiftUI

struct ThemeFooterView: View {
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        FooterContainer {
            HStack(spacing: 12) {
                Text("Текущая тема:")
                Text(themeManager.current.name).bold()
                Spacer()
                Button { themeManager.setRandom() } label: {
                    Label("Случайная", systemImage: "shuffle")
                        .labelStyle(.iconOnly)
                }
                .foregroundStyle(.white)
            }
        }
    }
}
