import SwiftUI

public struct ApplyBottomSheet: View {
    @Binding public var isPresented: Bool
    @State private var selectedOption: SelectionOption = .outgoing
    public var onComplete: (SelectionOption) -> Void
    
    public enum SelectionOption: String, CaseIterable {
        case outgoing = "외출 수락"
        case classroomMove = "교실 이동"
    }
    
    public init(
        isPresented: Binding<Bool>,
        onComplete: @escaping (SelectionOption) -> Void
    ) {
        self._isPresented = isPresented
        self.onComplete = onComplete
        UIPickerView.appearance().backgroundColor = .clear
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 100)
                .foregroundColor(.Gray.gray300)
                .frame(width: 40, height: 5)
                .padding(.top, 12)

            HStack {
                Text("수락할 활동을 선택해주세요")
                    .pickText(type: .label1, textColor: .Normal.black)
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, 32)
            
            Spacer()
                .frame(height: 40)

            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.Primary.primary50)
                    .frame(height: 32)
                    .padding(.horizontal, 24)
                
                Picker("", selection: $selectedOption) {
                    ForEach(SelectionOption.allCases, id: \.self) { option in
                        Text(option.rawValue)
                            .pickText(type: .subTitle1, textColor: .Normal.black)
                            .tag(option)
                    }
                }
                .pickerStyle(.wheel)
                .compositingGroup()
                .onAppear { removePickerBackground() }
            }
            .frame(height: 150)
            
            Spacer()
                .frame(minHeight: 20)

            PiCKButton(
                buttonText: "선택 완료",
                isEnabled: true,
                height: 47
            ) {
                onComplete(selectedOption)
                isPresented = false
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 28 + (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0))
        }
        .frame(maxHeight: UIScreen.main.bounds.height * 0.5)
        .background(Color.Normal.white)
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .ignoresSafeArea(edges: .bottom)
    }
    
    private func removePickerBackground() {
        DispatchQueue.main.async {
            UIPickerView.appearance().backgroundColor = .clear
            
            guard let window = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .flatMap({ $0.windows })
                .first(where: { $0.isKeyWindow }) else { return }
            
            func clearBackground(in view: UIView) {
                if let pickerView = view as? UIPickerView {
                    pickerView.backgroundColor = .clear
                    pickerView.subviews.forEach { $0.backgroundColor = .clear }
                }
                view.subviews.forEach { clearBackground(in: $0) }
            }
            
            clearBackground(in: window)
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
