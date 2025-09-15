import SwiftUI

extension View {
    func glassNavBar(toolBarLabel: String) -> some View {
        self
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(toolBarLabel)
                        .font(.headline)
                        .foregroundColor(.white)
                }
                
            }
    }
}

