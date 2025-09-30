import SwiftUI

public struct PiCKButton: View {
    public var buttonText: String
    public var isEnabled: Bool
    public var height: CGFloat
    public var action: () -> Void
    
    public init(
        buttonText: String = "",
        isEnabled: Bool = true,
        height: CGFloat = 47,
        action: @escaping () -> Void = {}
    ) {
        self.buttonText = buttonText
        self.isEnabled = isEnabled
        self.height = height
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(buttonText)
                .pickText(type: .button1, textColor: .Normal.white)
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .background(backgroundColor)
                .cornerRadius(8)
        }
        .disabled(!isEnabled)
    }
    
    private var backgroundColor: Color {
        isEnabled ? .Primary.primary500 : .Primary.primary100
    }
}
