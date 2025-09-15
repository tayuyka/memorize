import SwiftUI

struct ScoreFlashLayer: View {
    let text: String
    let isPositive: Bool

    @State private var fadeOut = false

    var body: some View {
        Text(text)
            .font(.system(size: 280, weight: .black))
            .foregroundStyle((isPositive ? Color.green : Color.red).opacity(0.8))
            .shadow(radius: 8)
            .scaleEffect(fadeOut ? 1.15 : 0.95)
            .opacity(fadeOut ? 0 : 1)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .allowsHitTesting(false)
            .onAppear {
                withAnimation(.easeOut(duration: 1.0)) {
                    fadeOut = true
                }
            }
    }
}

#Preview {
    ScoreFlashLayer(text: "+2", isPositive: false)
}

