import SwiftUI

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

