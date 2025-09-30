import SwiftUI

public struct PiCKUnderlineButton: View {
    public var buttonText: String
    public var isEnabled: Bool
    public var action: () -> Void
    
    public init(
        buttonText: String = "",
        isEnabled: Bool = true,
        action: @escaping () -> Void = {}
    ) {
        self.buttonText = buttonText
        self.isEnabled = isEnabled
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(buttonText)
                .underline()
                .pickText(type: .subTitle3, textColor: .Primary.primary500)
                .frame(height: 17)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .disabled(!isEnabled)
    }
}
