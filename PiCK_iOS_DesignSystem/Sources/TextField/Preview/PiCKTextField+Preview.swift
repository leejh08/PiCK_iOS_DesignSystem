import SwiftUI
import PiCK_iOS_DesignSystem

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
    }
}
