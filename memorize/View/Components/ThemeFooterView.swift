import SwiftUI

struct ThemeFooterView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    
    var body: some View {
        let style = themeManager.current.sectionsStyle
        VStack {
            HStack(spacing: 12) {
                Text("Текущая тема:")
                Text(themeManager.current.name).bold()
                Spacer()
                Button {
                    themeManager.setRandom()
                } label: {
                    Label("", systemImage: "shuffle")
                        .labelStyle(.iconOnly)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
        }
        .padding(.vertical, 1)
        .frame(maxWidth: .infinity)
        .foregroundStyle(.white)
        .background(
            RoundedCorner(radius: style.corner, corners: [.topLeft, .topRight])
                .fill(.ultraThinMaterial)
                .ignoresSafeArea(edges: .bottom)
        )
        .overlay(
            RoundedCorner(radius: style.corner, corners: [.topLeft, .topRight])
                .stroke(Color.white.opacity(style.strokeOpacity), lineWidth: 2)
                .ignoresSafeArea(edges: .bottom)
        )

    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
