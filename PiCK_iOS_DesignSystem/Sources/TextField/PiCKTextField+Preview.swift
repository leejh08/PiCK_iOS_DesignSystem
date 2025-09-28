import SwiftUI
@testable import PiCK_iOS_DesignSystem

struct PiCKTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            PiCKTextField(
                text: .constant(""),
                placeholder: "placeholder",
                titleText: "Title"
            )
            PiCKTextField(
                text: .constant("text"),
                placeholder: "placeholder",
                titleText: "Title",
                isSecurity: true
            )
            PiCKTextField(
                text: .constant("email"),
                placeholder: "placeholder",
                titleText: "Title",
                showEmail: true
            )
            PiCKTextField(
                text: .constant("email"),
                placeholder: "placeholder",
                titleText: "Title",
                showVerification: true
            )
            PiCKTextField(
                text: .constant("error"),
                placeholder: "placeholder",
                titleText: "Title",
                errorMessage: "Error message"
            )
        }
        .padding()
        .onAppear(perform: {
            Font.registerFonts()
        })
    }
}

extension Font {
    static func registerFonts() {
        DesignSystemFontFamily.WantedSans.all.forEach {
            registerFont(bundle: .module, fontName: $0.name, fontExtension: "otf")
        }
    }

    static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from filename: \(fontName) with extension \(fontExtension)")
        }

        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
