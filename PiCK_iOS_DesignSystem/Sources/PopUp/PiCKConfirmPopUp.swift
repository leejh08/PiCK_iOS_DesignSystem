import SwiftUI

public struct PiCKConfirmPopUp: View {
    public var title: String
    public var explain: String
    public var type: PiCKConfirmType
    @Binding public var isPresented: Bool
    public var onAction: ((PiCKConfirmAction) -> Void)?

    @State private var scale: CGFloat = 0.8
    @State private var opacity: Double = 0

    private var confirmButtonColor: Color {
        switch type {
        case .reject:
            return Color.Error.error
        case .accept:
            return Color.Primary.primary500
        }
    }

    public init(
        title: String,
        explain: String,
        type: PiCKConfirmType = .accept,
        isPresented: Binding<Bool>,
        onAction: ((PiCKConfirmAction) -> Void)? = nil
    ) {
        self.title = title
        self.explain = explain
        self.type = type
        self._isPresented = isPresented
        self.onAction = onAction
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .pickText(type: .subTitle2, textColor: .Normal.black)
                .multilineTextAlignment(.leading)
                .padding(.top, 24)
                .padding(.leading, 20)
                .padding(.trailing, 20)

            Text(explain)
                .pickText(type: .body1, textColor: .Gray.gray600)
                .padding(.top, 12)
                .padding(.leading, 20)
                .padding(.bottom, 16)

            HStack(spacing: 8) {
                Button {
                    onAction?(.cancel)
                    hidePopUp()
                } label: {
                    Text("취소")
                        .pickText(type: .body1, textColor: .Gray.gray600)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(Color.Gray.gray50)
                        .cornerRadius(8)
                }

                Button {
                    onAction?(.accept)
                    hidePopUp()
                } label: {
                    Text("확인")
                        .pickText(type: .body1, textColor: .Normal.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(confirmButtonColor)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .frame(width: 330)
        .background(Color.Normal.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
        .scaleEffect(scale)
        .opacity(opacity)
        .onAppear {
            showPopUp()
        }
    }
    
    private func showPopUp() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0)) {
            scale = 1.0
            opacity = 1
        }
    }
    
    private func hidePopUp() {
        withAnimation(.easeOut(duration: 0.2)) {
            scale = 0.8
            opacity = 0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            isPresented = false
        }
    }
}

public extension View {
    func confirmPopUp(
        title: String,
        explain: String,
        type: PiCKConfirmType = .accept,
        isPresented: Binding<Bool>,
        onAction: ((PiCKConfirmAction) -> Void)? = nil
    ) -> some View {
        ZStack {
            self
            
            if isPresented.wrappedValue {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isPresented.wrappedValue = false
                        }
                    }
                
                PiCKConfirmPopUp(
                    title: title,
                    explain: explain,
                    type: type,
                    isPresented: isPresented,
                    onAction: onAction
                )
            }
        }
    }
}
