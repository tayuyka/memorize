import SwiftUI

struct SectionsStyle: Hashable {
        let corner: CGFloat
        let strokeOpacity: CGFloat
        let strokeWidth: CGFloat
        let backgroundOpacity: CGFloat


        static let `default` = SectionsStyle(
            corner: 22,
            strokeOpacity: 0.65,
            strokeWidth: 1.2,
            backgroundOpacity: 0.01
        )
    }
struct CardStyle: Hashable {
        let corner: CGFloat
        let strokeOpacity: CGFloat
        let strokeWidth: CGFloat
        let frontBackgroundOpacity: CGFloat
        let backBackgroundOpacity: CGFloat

        static let `default` = CardStyle(
            corner: 22,
            strokeOpacity: 0.65,
            strokeWidth: 1.2,
            frontBackgroundOpacity: 0.01,
            backBackgroundOpacity: 0.25
        )
    }
