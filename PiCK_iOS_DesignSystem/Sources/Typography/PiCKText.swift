import SwiftUI
import UIKit

public extension View {
    func pickText(type: PiCKFontType, textColor: Color) -> some View {
        ModifiedContent(content: self, modifier: PiCKText(type: type, textColor: textColor))
    }
    func pickText(type: PiCKFontType) -> some View {
        ModifiedContent(content: self, modifier: PiCKText(type: type))
    }
}

struct PiCKText: ViewModifier {
    var type: PiCKFontType
    var textColor: Color
    var font: UIFont

    init(type: PiCKFontType, textColor: Color) {
        self.type = type
        self.textColor = textColor
        if textColor == .Normal.white && type.fontWeight == .regular {
            self.font = Self.getPretendardFont(size: type.fontSize, weight: .medium)
        } else {
            self.font = Self.getPretendardFont(size: type.fontSize, weight: type.fontWeight)
        }
    }
    init(type: PiCKFontType) {
        self.type = type
        self.textColor = type.defaultColor
        self.font = Self.getPretendardFont(size: type.fontSize, weight: type.fontWeight)
    }

    func body(content: Content) -> some View {
        content
            .font(Font(font))
            .foregroundColor(textColor)
    }

}

private extension PiCKText {
    static func getPretendardFont(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let fontName: String
        switch weight {
        case .medium:
            fontName = "Pretendard-Medium"
        case .semibold:
            fontName = "Pretendard-SemiBold"
        case .regular:
            fontName = "Pretendard-Regular"
        default:
            fontName = "Pretendard-Regular"
        }
        return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size, weight: weight)
    }
}

// MARK: Preview
struct PiCKText_Preview: PreviewProvider {
    static var previews: some View {
        PiCKTextPreview()
            .previewDevice("iPad mini (6th generation)")
    }
}
