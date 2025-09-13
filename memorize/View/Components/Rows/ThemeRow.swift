import SwiftUI

struct ThemeRow: View {
    let theme: Theme
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                GradientSwatch(colors: theme.backgroundGradient)
                    .frame(width: 40, height: 22)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(.white.opacity(0.25)))

                Text(theme.name).bold()
                Spacer()
            }
            .contentShape(Rectangle())
            .padding(.vertical, 8)
        }
        .padding(.vertical, 10)
        .buttonStyle(.plain)
        .foregroundStyle(.white)
    }
}

private struct ColorSwatch: View {
    let color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(color)
            .frame(width: 22, height: 22)
            .overlay(RoundedRectangle(cornerRadius: 6).stroke(.white.opacity(0.25)))
    }
}

private struct GradientSwatch: View {
    let colors: [Color]
    var body: some View {
        LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

