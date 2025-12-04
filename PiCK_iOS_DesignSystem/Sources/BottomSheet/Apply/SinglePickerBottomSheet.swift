import SwiftUI

public struct SinglePickerBottomSheet: View {
    @Binding public var isPresented: Bool
    public var title: String
    public var options: [String]
    @State private var selectedIndex: Int = 0
    public var onComplete: (String) -> Void
    
    public init(
        isPresented: Binding<Bool>,
        title: String,
        options: [String],
        onComplete: @escaping (String) -> Void
    ) {
        self._isPresented = isPresented
        self.title = title
        self.options = options
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
                Text(title)
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
                
                Picker("", selection: $selectedIndex) {
                    ForEach(options.indices, id: \.self) { idx in
                        Text(options[idx])
                            .pickText(type: .subTitle1, textColor: .Normal.black)
                            .tag(idx)
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
                onComplete(options[selectedIndex])
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
