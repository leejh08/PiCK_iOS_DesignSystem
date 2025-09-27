import SwiftUI

extension DesignSystemAsset.Color {
    public var swiftUIColor: Color {
        Color(self.color)
    }
}

extension DesignSystemAsset.Image {
    public var swiftUIImage: Image {
        Image(asset: self)
    }
}