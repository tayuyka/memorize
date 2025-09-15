
import SwiftUI

/// Базовый стеклянный футер с закруглёнными верхними углами.
/// Рисует фон/рамку из текущей темы (SectionsStyle) и вставляет внутрь ваш контент.
struct FooterContainer<Content: View>: View {
    @EnvironmentObject private var themeManager: ThemeManager
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        let s = themeManager.current.sectionsStyle

        VStack(spacing: 0) {
            content
                .padding(.horizontal)
                .padding(.vertical, 12)
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(.white)
        .background(
            RoundedCorner(radius: s.corner, corners: [.topLeft, .topRight])
                .fill(.ultraThinMaterial)
                .ignoresSafeArea(edges: .bottom)
        )
        .overlay(
            RoundedCorner(radius: s.corner, corners: [.topLeft, .topRight])
                .stroke(Color.white.opacity(s.strokeOpacity), lineWidth: 2)
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
