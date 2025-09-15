import SwiftUI

struct FittingGrid<Content: View>: View {
    let itemCount: Int
    let spacing: CGFloat
    let horizontalPadding: CGFloat
    let aspectRatio: CGFloat
    let baseMinWidth: CGFloat
    let content: (Int, CGFloat) -> Content

    init(
        itemCount: Int,
        spacing: CGFloat = 12,
        horizontalPadding: CGFloat = 10,
        aspectRatio: CGFloat = 2.0/3.0,
        baseMinWidth: CGFloat = 70,
        @ViewBuilder content: @escaping (Int, CGFloat) -> Content
    ) {
        self.itemCount = itemCount
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding
        self.aspectRatio = aspectRatio
        self.baseMinWidth = baseMinWidth
        self.content = content
    }

    var body: some View {
        GeometryReader { geo in
            let availW = geo.size.width - horizontalPadding * 2

            let defaultColumns = max(
                2,
                Int((availW + spacing) / (baseMinWidth + spacing))
            )

            let pairs = itemCount / 2

            let extraColumns = max(0, Int(ceil(Double(max(0, pairs - 10)) / 6.0)))
            let columnsCount = defaultColumns + extraColumns

            let totalSpacing = spacing * CGFloat(columnsCount - 1)
            let cellW = (availW - totalSpacing) / CGFloat(columnsCount)

            let columns = Array(repeating: GridItem(.fixed(cellW), spacing: spacing), count: columnsCount)

            LazyVGrid(columns: columns, spacing: spacing) {
                ForEach(0..<itemCount, id: \.self) { i in
                    content(i, cellW)
                        .frame(width: cellW, height: cellW / aspectRatio)
                }
            }
            .padding(.horizontal, horizontalPadding)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}
