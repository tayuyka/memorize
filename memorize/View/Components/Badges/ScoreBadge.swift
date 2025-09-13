import SwiftUI

struct ScoreBadge: View {
    let score: Int
    
    @State private var shakeToken: CGFloat = 0
    @State private var lastScore: Int = 0
    @State private var shakeAxis: ShakeEffect.Axis = .horizontal
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "star.fill")
            Text("Очки:")
            Text("\(score)")
                .monospacedDigit()
                .contentTransition(.numericText())
                .animation(.easeInOut(duration: 0.25), value: score)
        }
        .lineLimit(1)
        .fixedSize(horizontal: true, vertical: false)
        .layoutPriority(1)
        .modifier(ShakeEffect(shakes: shakeToken, axis: shakeAxis))
        .onAppear {
            lastScore = score
        }
        .onChange(of: score) { old, new in
            let delta = new - old
            guard delta != 0 else { return }
            
            shakeAxis = delta > 0 ? .vertical : .horizontal
            withAnimation(.easeOut(duration: 0.35)) {
                shakeToken += 1
            }
        }
    }
}


struct ShakeEffect: GeometryEffect {
    enum Axis { case horizontal, vertical }
    
    var amount: CGFloat = 6
    var shakes: CGFloat = 0
    var axis: Axis = .horizontal
    
    var animatableData: CGFloat {
        get { shakes }
        set { shakes = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let offset = amount * sin(shakes * .pi * 2)
        switch axis {
        case .horizontal:
            return ProjectionTransform(.init(translationX: offset, y: 0))
        case .vertical:
            return ProjectionTransform(.init(translationX: 0, y: offset))
        }
    }
}

