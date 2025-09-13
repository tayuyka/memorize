import SwiftUI

struct AttachFooter<Footer: View>: ViewModifier {
    @ViewBuilder let footer: () -> Footer

    func body(content: Content) -> some View {
        content.safeAreaInset(edge: .bottom) {
            footer()
        }
    }
}

extension View {
    func attachFooter<Footer: View>(@ViewBuilder _ footer: @escaping () -> Footer) -> some View {
        self.modifier(AttachFooter(footer: footer))
    }
}
