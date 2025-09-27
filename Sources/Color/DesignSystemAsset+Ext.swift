import SwiftUI

extension DesignSystemAsset.Color {
    public var swiftUIColor: Color {
        Color(self.color)
    }
}
