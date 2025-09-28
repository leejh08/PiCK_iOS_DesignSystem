import SwiftUI
import UIKit

public extension Text {
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

        if textColor == .modeWhite && type.fontWeight == .regular {
            self.font = .systemFont(ofSize: type.fontSize, weight: .medium)
        } else {
            self.font = .systemFont(ofSize: type.fontSize, weight: type.fontWeight)
        }
    }
    init(type: PiCKFontType) {
        self.type = type
        self.font = .systemFont(ofSize: type.fontSize, weight: type.fontWeight)
        self.textColor = type.defaultColor
    }

    func body(content: Content) -> some View {
        content
            .font(Font(font))
            .lineSpacing(type.lineHeight - font.lineHeight)
            .padding(.vertical, (type.lineHeight - font.lineHeight) / 2)
            .foregroundColor(textColor)
    }

}

// MARK: Preview
struct PiCKText_Preview: PreviewProvider {
    static var previews: some View {
        PiCKTextPreview()
            .previewDevice("iPad mini (6th generation)")
    }
}
