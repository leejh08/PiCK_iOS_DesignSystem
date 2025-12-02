import SwiftUI

extension DualPickerBottomSheet {
    public static func classroom(
        isPresented: Binding<Bool>,
        grade: Binding<Int>,
        klass: Binding<Int>,
        onComplete: @escaping (Int, Int) -> Void
    ) -> DualPickerBottomSheet {
        let firstOptions = ["1", "2", "3"]
        let secondOptions = ["1", "2", "3", "4"]

        let firstValue = Binding<String>(
            get: { String(grade.wrappedValue) },
            set: { grade.wrappedValue = Int($0) ?? grade.wrappedValue }
        )
        let secondValue = Binding<String>(
            get: { String(klass.wrappedValue) },
            set: { klass.wrappedValue = Int($0) ?? klass.wrappedValue }
        )

        return DualPickerBottomSheet(
            isPresented: isPresented,
            firstValue: firstValue,
            secondValue: secondValue,
            title: "학년과 반을 선택해주세요",
            firstLabel: "학년",
            secondLabel: "반",
            firstOptions: firstOptions,
            secondOptions: secondOptions,
            buttonText: "선택 완료",
            onComplete: { first, second in
                onComplete(Int(first) ?? grade.wrappedValue, Int(second) ?? klass.wrappedValue)
            }
        )
    }

    public static func classroomMoveTime(
        isPresented: Binding<Bool>,
        startHour: Binding<Int>,
        endHour: Binding<Int>,
        onComplete: @escaping (Int, Int) -> Void
    ) -> DualPickerBottomSheet {
        let firstOptions = (5...12).map { String($0) }
        let secondOptions = (5...12).map { String($0) }

        let firstValue = Binding<String>(
            get: { String(startHour.wrappedValue) },
            set: { startHour.wrappedValue = Int($0) ?? startHour.wrappedValue }
        )
        let secondValue = Binding<String>(
            get: { String(endHour.wrappedValue) },
            set: { endHour.wrappedValue = Int($0) ?? endHour.wrappedValue }
        )

        return DualPickerBottomSheet(
            isPresented: isPresented,
            firstValue: firstValue,
            secondValue: secondValue,
            title: "교실 이동 시간을 선택해주세요",
            firstLabel: "교시",
            secondLabel: "교시",
            firstOptions: firstOptions,
            secondOptions: secondOptions,
            buttonText: "신청하기",
            onComplete: { first, second in
                onComplete(Int(first) ?? startHour.wrappedValue, Int(second) ?? endHour.wrappedValue)
            }
        )
    }
}

// MARK: - Preview
struct DualPickerBottomSheetPreviewWrapper: View {
    @State private var isPresented = false
    @State private var grade = 1
    @State private var klass = 1

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("선택된 값: \(grade)학년 \(klass)반")
                    .font(.headline)

                Button("Show Bottom Sheet") {
                    isPresented = true
                }
            }
            .padding()

            if isPresented {
                ZStack {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            isPresented = false
                        }
                    
                    VStack {
                        Spacer()
                        
                        DualPickerBottomSheet.classroom(
                            isPresented: $isPresented,
                            grade: $grade,
                            klass: $klass
                        ) { selectedGrade, selectedKlass in
                            grade = selectedGrade
                            klass = selectedKlass
                        }
                    }
                    .ignoresSafeArea()
                }
            }
        }
    }
}

#Preview {
    DualPickerBottomSheetPreviewWrapper()
}
