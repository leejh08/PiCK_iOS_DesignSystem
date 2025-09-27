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
                    .font(.pick(.label1))
                    .foregroundColor(Color(asset: PiCKColor.ModeColor.modeBlack))
            }
            HStack {
                if isSecure {
                    SecureField(placeholder, text: $text)
                        .font(.pick(.caption1))
                        .foregroundColor(Color(asset: PiCKColor.ModeColor.modeBlack))
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                } else {
                    TextField(placeholder, text: $text, onEditingChanged: { editing in
                        isEditing = editing
                    })
                    .font(.pick(.caption1))
                    .foregroundColor(Color(asset: PiCKColor.ModeColor.modeBlack))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                }

                if isSecurity {
                    Button(action: {
                        isSecure.toggle()
                    }) {
                        Image(asset: isSecure ? PiCKImage.MainIcon.eyeOff : PiCKImage.MainIcon.eyeOn)
                            .foregroundColor(Color(asset: PiCKColor.ModeColor.modeBlack))
                    }
                } else if showVerification {
                    Button(action: {
                        verificationButtonTapped?()
                    }) {
                        Text("인증코드")
                            .font(.pick(.button2))
                            .foregroundColor(Color(asset: PiCKColor.Main.main900))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(Color(asset: PiCKColor.Main.main50))
                            .cornerRadius(5)
                    }
                } else if showEmail {
                    Text("@dsm.hs.kr")
                        .font(.pick(.caption2))
                        .foregroundColor(Color(asset: PiCKColor.Gray.gray500))
                }
            }
            .padding(.horizontal, 16)
            .frame(height: 48)
            .background(Color(asset: PiCKColor.Gray.gray50))
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(borderColor, lineWidth: 1)
            )

            if let errorMessage = errorMessage, !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(.pick(.caption2))
                    .foregroundColor(Color(asset: PiCKColor.Error.error))
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }

    private var borderColor: Color {
        if errorMessage != nil {
            return Color(asset: PiCKColor.Error.error)
        } else if isEditing {
            return Color(asset: PiCKColor.Main.main500)
        } else {
            return .clear
        }
    }
}
