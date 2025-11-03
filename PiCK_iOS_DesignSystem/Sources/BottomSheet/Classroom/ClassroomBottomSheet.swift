import SwiftUI

public struct ClassroomBottomSheet: View {
    @Binding public var isPresented: Bool
    @Binding var grade: Int
    @Binding var `class`: Int
    public var onComplete: (Int, Int) -> Void

    public init(
        isPresented: Binding<Bool>,
        grade: Binding<Int>,
        class: Binding<Int>,
        onComplete: @escaping (Int, Int) -> Void
    ) {
        self._isPresented = isPresented
        self._grade = grade
        self._class = `class`
        self.onComplete = onComplete
        UIPickerView.appearance().backgroundColor = .clear
        if grade.wrappedValue < 1 || grade.wrappedValue > 3 {
            grade.wrappedValue = 1
        }
        if `class`.wrappedValue < 1 || `class`.wrappedValue > 4 {
            `class`.wrappedValue = 1
        }
    }

    public var body: some View {
        VStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 100)
                .foregroundColor(.Gray.gray300)
                .frame(width: 40, height: 5)
                .padding(.top, 12)


            HStack {
                Text("학년과 반을 선택해주세요")
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
                        Picker("", selection: $grade) {
                            ForEach(1...3, id: \.self) { num in
                                Text("\(num)")
                                    .pickText(type: .subTitle1, textColor: .Normal.black)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 50)
                        .clipped()
                        .compositingGroup()
                        
                        Text("학년")
                            .pickText(type: .subTitle1, textColor: .Normal.black)
                            .offset(x: -15)
                    }

                    Text("-")
                        .pickText(type: .heading3, textColor: .Normal.black)

                    HStack(spacing: 4) {
                        Picker("", selection: $class) {
                            ForEach(1...4, id: \.self) { num in
                                Text("\(num)")
                                    .pickText(type: .subTitle1, textColor: .Normal.black)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 50)
                        .clipped()
                        .compositingGroup()

                        Text("반")
                            .pickText(type: .subTitle1, textColor: .Normal.black)
                    }
                }
                .onAppear { removePickerBackground() }
            }
            .frame(height: 150)

            Spacer().frame(minHeight: 20)

            PiCKButton(
                buttonText: "선택 완료",
                isEnabled: true,
                height: 47
            ) {
                onComplete(grade, `class`)
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

