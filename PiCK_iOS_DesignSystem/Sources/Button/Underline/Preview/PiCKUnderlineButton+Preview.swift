import SwiftUI

struct PiCKUnderlineButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            PiCKUnderlineButton(
                buttonText: "Default Underline Button",
                action: {}
            )
            
            PiCKUnderlineButton(
                buttonText: "Disabled Underline Button",
                isEnabled: false,
                action: {}
            )
        }
        .padding()
    }
}
