import SwiftUI

struct PiCKButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            PiCKButton(
                buttonText: "Default Button",
                action: {}
            )
            
            PiCKButton(
                buttonText: "Disabled Button",
                isEnabled: false,
                action: {}
            )
            
            PiCKButton(
                buttonText: "Custom Height Button",
                height: 60,
                action: {}
            )
            
            PiCKButton(
                buttonText: "Small Button",
                height: 36,
                action: {}
            )
        }
        .padding()
    }
}
