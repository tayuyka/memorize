import SwiftUI

struct SectionContainer<Content: View>: View {
    @EnvironmentObject private var themeManager: ThemeManager

    let title: LocalizedStringKey?
    @ViewBuilder var content: Content

    init(_ title: LocalizedStringKey? = nil, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        let style = themeManager.current.sectionsStyle
        let shape = RoundedRectangle(cornerRadius: style.corner, style: .continuous)

        VStack(alignment: .leading, spacing: 0) {
            if let title {
                Text(title)
                    .font(.largeTitle).bold()                    .padding(.horizontal, 14)
                    .padding(.vertical, 12)
                    .foregroundStyle(.white.opacity(0.9))
            }

            VStack(spacing: 0) {
                content
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
        }
        .foregroundStyle(.white)
        .background(
            shape
                .fill(.ultraThinMaterial)
                .background(shape.fill(Color.white.opacity(style.backgroundOpacity)))
        )
        .overlay(
            shape.stroke(.white.opacity(style.strokeOpacity), lineWidth: style.strokeWidth)
        )
    }
}

