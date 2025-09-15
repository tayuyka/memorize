import SwiftUI

struct GlassBottomSheet<Content: View>: View {
    @EnvironmentObject private var themeManager: ThemeManager

    @Binding var isPresented: Bool
    let allowsDragToDismiss: Bool
    let content: Content

    @State private var translation: CGFloat = 0
    @State private var contentHeight: CGFloat = 0

    init(isPresented: Binding<Bool>, allowsDragToDismiss: Bool = true, @ViewBuilder content: () -> Content) {
        self._isPresented = isPresented
        self.allowsDragToDismiss = allowsDragToDismiss
        self.content = content()
    }

    var body: some View {
        let s = themeManager.current.sectionsStyle
        let shape = RoundedCorner(radius: s.corner, corners: [.topLeft, .topRight])

        ZStack(alignment: .bottom) {
            if isPresented {
                Color.black.opacity(0.28)
                    .ignoresSafeArea()
                    .transition(.opacity)
                    .onTapGesture { isPresented = false }

                VStack(spacing: 0) {
                    Capsule()
                        .fill(.white.opacity(0.35))
                        .frame(width: 44, height: 5)
                        .padding(.top, 8)
                        .padding(.bottom, 8)

                    content
                        .readSize { contentHeight = $0.height }
                        .padding(.horizontal, 12)
                        .padding(.bottom, 16)
                }
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(
                    shape
                        .fill(.ultraThinMaterial)
                        .background(shape.fill(Color.white.opacity(s.backgroundOpacity)))
                        .ignoresSafeArea(edges: .bottom)
                )
                .offset(y: translation)
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .gesture(
                    allowsDragToDismiss ?
                    DragGesture()
                        .onChanged { value in
                            translation = max(0, value.translation.height)
                        }
                        .onEnded { value in
                            let velocity = value.velocity.height
                            if translation > contentHeight * 0.25 || velocity > 1200 {
                                withAnimation(.spring(response: 0.34, dampingFraction: 0.9)) {
                                    isPresented = false
                                    translation = 0
                                }
                            } else {
                                withAnimation(.spring(response: 0.34, dampingFraction: 0.9)) {
                                    translation = 0
                                }
                            }
                        }
                    : nil
                )
                .zIndex(1)
            }
        }
        .animation(.easeInOut(duration: 0.2), value: isPresented)
    }
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) { value = nextValue() }
}
private extension View {
    func readSize(_ onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { proxy in
                Color.clear.preference(key: SizePreferenceKey.self, value: proxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}
