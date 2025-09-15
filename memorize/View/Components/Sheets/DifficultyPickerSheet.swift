import SwiftUI

struct DifficultyPickerSheet: View {
    let onPick: (GamePairs) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Выберите сложность")
                .font(.headline)
                .foregroundStyle(.white)
                .padding(.horizontal)

            VStack(spacing: 8) {
                ForEach(GamePairs.all) { diff in
                    Button {
                        onPick(diff)
                    } label: {
                        HStack {
                            Image(systemName: "gamecontroller.fill")
                            Text(diff.title).bold()
                            Spacer()
                            Text(diff.caption)
                                .foregroundStyle(.white.opacity(0.75))
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 14)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .stroke(.white.opacity(0.25), lineWidth: 1)
                        )
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(.white)
                }
            }
            .padding(.horizontal)

            Button {
                onPick(GamePairs.all.randomElement()!)
            } label: {
                HStack {
                    Image(systemName: "shuffle")
                    Text("Случайная")
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
            }
            .buttonStyle(.bordered)
            .tint(.white)
            .padding(.horizontal)
            .padding(.top, 4)
        }
        .padding(.bottom, 12)
    }
}
