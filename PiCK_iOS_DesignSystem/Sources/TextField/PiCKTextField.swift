import SwiftUI
import Combine

public struct PiCKTextField: View {
    @Binding public var text: String
    public var placeholder: String
    public var titleText: String?
    public var isSecurity: Bool
    public var showEmail: Bool
    public var showVerification: Bool
    public var errorMessage: String?
    public var verificationButtonTapped: (() -> Void)?

    @State private var isEditing: Bool = false
    @State private var isSecure: Bool = false
    @State private var isVerificationSent: Bool = false

    public init(
        text: Binding<String>,
        placeholder: String = "",
        titleText: String? = nil,
        isSecurity: Bool = false,
        showEmail: Bool = false,
        showVerification: Bool = false,
        errorMessage: String? = nil,
        verificationButtonTapped: (() -> Void)? = nil
    ) {
        self._text = text
        self.placeholder = placeholder
        self.titleText = titleText
        self.isSecurity = isSecurity
        self.showEmail = showEmail
        self.showVerification = showVerification
        self.errorMessage = errorMessage
        self.verificationButtonTapped = verificationButtonTapped
        self._isSecure = State(initialValue: isSecurity)
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if let titleText = titleText {
                Text(titleText)
                    .pickText(type: .label1, textColor: .Normal.black)
            }
            HStack {
                if isSecure {
                    SecureField(placeholder, text: $text)
                        .pickText(type: .caption2, textColor: .Normal.black)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                } else {
                    TextField(placeholder, text: $text, onEditingChanged: { editing in
                        isEditing = editing
                    })
                    .pickText(type: .caption2, textColor: .Normal.black)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                }

                if isSecurity {
                    Button(action: {
                        isSecure.toggle()
                    }) {
                        Image(isSecure ? "eyeOff" : "eyeOn", bundle: .module)
                            .foregroundColor(.Normal.black)
                    }
                } else if showVerification {
                    Text("@dsm.hs.kr")
                        .pickText(type: .caption2, textColor: .Gray.gray500)
                    Button(action: {
                        verificationButtonTapped?()
                        isVerificationSent = true
                    }) {
                        Text(isVerificationSent ? "재발송" : "인증 코드")
                            .pickText(type: .button2, textColor: .Main.main900)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(Color.Main.main50)
                            .cornerRadius(5)
                    }
                } else if showEmail {
                    Text("@dsm.hs.kr")
                        .pickText(type: .caption2, textColor: .Gray.gray500)
                }
            }
            .padding(.horizontal, 16)
            .frame(height: 40)
            .background(Color.Gray.gray50)
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(borderColor, lineWidth: 1)
            )

            if let errorMessage = errorMessage, !errorMessage.isEmpty {
                Text(errorMessage)
                    .pickText(type: .body1, textColor: .Error.error)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }

    private var borderColor: Color {
        if errorMessage != nil {
            return .Error.error
        } else if isEditing {
            return .Main.main500
        } else {
            return .clear
        }
    }
}
