import SwiftUI

public struct DualPickerBottomSheet: View {
    @Binding public var isPresented: Bool
    @Binding var firstValue: Int
    @Binding var secondValue: Int
    public var title: String
    public var firstLabel: String
    public var secondLabel: String
    public var firstRange: ClosedRange<Int>
    public var secondRange: ClosedRange<Int>
    public var buttonText: String
    public var onComplete: (Int, Int) -> Void

    public init(
        isPresented: Binding<Bool>,
        firstValue: Binding<Int>,
        secondValue: Binding<Int>,
        title: String,
        firstLabel: String,
        secondLabel: String,
        firstRange: ClosedRange<Int>,
        secondRange: ClosedRange<Int>,
        buttonText: String = "선택 완료",
        onComplete: @escaping (Int, Int) -> Void
    ) {
        self._isPresented = isPresented
        self._firstValue = firstValue
        self._secondValue = secondValue
        self.title = title
        self.firstLabel = firstLabel
        self.secondLabel = secondLabel
        self.firstRange = firstRange
        self.secondRange = secondRange
        self.buttonText = buttonText
        self.onComplete = onComplete
        UIPickerView.appearance().backgroundColor = .clear

        if !firstRange.contains(firstValue.wrappedValue) {
            firstValue.wrappedValue = firstRange.lowerBound
        }
        if !secondRange.contains(secondValue.wrappedValue) {
            secondValue.wrappedValue = secondRange.lowerBound
        }
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

            Spacer().frame(height: 40)

            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.Primary.primary50)
                    .frame(height: 32)
                    .padding(.horizontal, 24)

                HStack(spacing: 30) {
                    HStack(spacing: 0) {
                        Picker("", selection: $firstValue) {
                            ForEach(Array(firstRange), id: \.self) { num in
                                Text("\(num)")
                                    .pickText(type: .subTitle1, textColor: .Normal.black)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 50)
                        .clipped()
                        .compositingGroup()
                        
                        Text(firstLabel)
                            .pickText(type: .subTitle1, textColor: .Normal.black)
                            .offset(x: -15)
                    }

                    Text("-")
                        .pickText(type: .heading3, textColor: .Normal.black)

                    HStack(spacing: 0) {
                        Picker("", selection: $secondValue) {
                            ForEach(Array(secondRange), id: \.self) { num in
                                Text("\(num)")
                                    .pickText(type: .subTitle1, textColor: .Normal.black)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 50)
                        .clipped()
                        .compositingGroup()

                        Text(secondLabel)
                            .pickText(type: .subTitle1, textColor: .Normal.black)
                            .offset(x: -15)
                    }
                }
                .onAppear { removePickerBackground() }
            }
            .frame(height: 150)

            Spacer().frame(minHeight: 20)

            PiCKButton(
                buttonText: buttonText,
                isEnabled: true,
                height: 47
            ) {
                onComplete(firstValue, secondValue)
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
