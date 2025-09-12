import SwiftUI

struct GlassCapsule: View {
    let systemImage: String
    let title: String?
    let theme: Theme

    var body: some View {
        let style = theme.sectionsStyle
        let shape = RoundedRectangle(cornerRadius: style.corner, style: .continuous)

        HStack(spacing: 8) {
            Image(systemName: systemImage)
            if let title {
                Text(title)
            }
        }
        .font(.title2).bold()
        .foregroundStyle(.white)
        .padding(.horizontal, 18)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity)
        .background(
            shape
                .fill(.ultraThinMaterial)
                .background(
                    shape.fill(Color.cyan.opacity(style.backgroundOpacity))
                )
        )
        .overlay(
            shape.stroke(.white.opacity(style.strokeOpacity), lineWidth: style.strokeWidth)
        )
        .overlay(
            shape
                .stroke(
                    LinearGradient(
                        colors: [.white.opacity(0.45), .white.opacity(0.08), .clear],
                        startPoint: .top, endPoint: .bottom
                    ),
                    lineWidth: 0.9
                )
                .blendMode(.plusLighter)
        )
        .contentShape(Rectangle())
    }
}
