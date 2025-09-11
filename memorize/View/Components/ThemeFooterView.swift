import SwiftUI

struct ThemeFooterView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    
    var body: some View {
        HStack(spacing: 12) {
            Text("Текущая тема:")
            Text(themeManager.current.name).bold()
            Spacer()
            Button{
                themeManager.setRandom()
            } label: {
                Label("",systemImage: "shuffle")
                    .labelStyle(.iconOnly)
            }
        }.padding(.horizontal)
            .padding(.vertical, 10)
            .overlay(
                Divider(), alignment: .top
            )
    }
}
