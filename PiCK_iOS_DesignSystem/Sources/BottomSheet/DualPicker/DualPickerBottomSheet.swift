import SwiftUI

public struct DualPickerBottomSheet: View {
    @Binding public var isPresented: Bool
    @Binding var firstValue: String
    @Binding var secondValue: String
    public var title: String
    public var firstLabel: String
    public var secondLabel: String
    public var firstOptions: [String]
    public var secondOptions: [String]
    public var buttonText: String
    public var onComplete: (String, String) -> Void

    public init(
        isPresented: Binding<Bool>,
        firstValue: Binding<String>,
        secondValue: Binding<String>,
        title: String,
        firstLabel: String,
        secondLabel: String,
        firstOptions: [String],
        secondOptions: [String],
        buttonText: String = "선택 완료",
        onComplete: @escaping (String, String) -> Void
    ) {
        self._isPresented = isPresented
        self._firstValue = firstValue
        self._secondValue = secondValue
        self.title = title
        self.firstLabel = firstLabel
        self.secondLabel = secondLabel
        self.firstOptions = firstOptions
        self.secondOptions = secondOptions
        self.buttonText = buttonText
        self.onComplete = onComplete
        UIPickerView.appearance().backgroundColor = .clear

        if !firstOptions.contains(firstValue.wrappedValue) {
            firstValue.wrappedValue = firstOptions.first ?? ""
        }
        if !secondOptions.contains(secondValue.wrappedValue) {
            secondValue.wrappedValue = secondOptions.first ?? ""
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
                .padding(.top, 20)

                Spacer()

                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.Primary.primary50)
                        .frame(height: 32)
                        .padding(.horizontal, 24)

                    HStack(spacing: 20) {
                        HStack(spacing: 0) {
                            Picker("", selection: $firstValue) {
                                ForEach(firstOptions, id: \.self) { option in
                                    Text(option)
                                        .pickText(type: .subTitle1, textColor: .Normal.black)
                                }
                            }
                            .pickerStyle(.wheel)
                            .frame(width: 80)
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
                                ForEach(secondOptions, id: \.self) { option in
                                    Text(option)
                                        .pickText(type: .subTitle1, textColor: .Normal.black)
                                }
                            }
                            .pickerStyle(.wheel)
                            .frame(width: 80)
                            .clipped()
                            .compositingGroup()

                            Text(secondLabel)
                                .pickText(type: .subTitle1, textColor: .Normal.black)
                                .offset(x: -15)
                        }
                    }
                    
                }
                .frame(height: 120)

                Spacer()

                PiCKButton(
                    buttonText: buttonText,
                    isEnabled: true,
                    height: 47
                ) {
                    onComplete(firstValue, secondValue)
                    isPresented = false
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 32)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.Normal.white)
            .cornerRadius(20, corners: [.topLeft, .topRight])
        }
}

#Preview {
    @State var isPresented = true
    @State var first = "전체"
    @State var second = "전체"

    return ZStack {
        Color.gray.opacity(0.3).ignoresSafeArea()
        
        VStack {
            Spacer()
            DualPickerBottomSheet(
                isPresented: $isPresented,
                firstValue: $first,
                secondValue: $second,
                title: "학년 / 반 선택",
                firstLabel: "학년",
                secondLabel: "반",
                firstOptions: ["전체", "1", "2", "3"],
                secondOptions: ["전체", "1", "2", "3", "4"],
                onComplete: { _, _ in }
            )
        }
        .ignoresSafeArea()
    }
}
