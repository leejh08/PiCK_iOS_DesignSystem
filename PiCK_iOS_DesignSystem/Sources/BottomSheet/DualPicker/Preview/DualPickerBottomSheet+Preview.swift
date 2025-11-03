import SwiftUI

extension DualPickerBottomSheet {
    public static func classroom(
        isPresented: Binding<Bool>,
        grade: Binding<Int>,
        klass: Binding<Int>,
        onComplete: @escaping (Int, Int) -> Void
    ) -> DualPickerBottomSheet {
        DualPickerBottomSheet(
            isPresented: isPresented,
            firstValue: grade,
            secondValue: klass,
            title: "학년과 반을 선택해주세요",
            firstLabel: "학년",
            secondLabel: "반",
            firstRange: 1...3,
            secondRange: 1...4,
            buttonText: "선택 완료",
            onComplete: onComplete
        )
    }

    public static func classroomMoveTime(
        isPresented: Binding<Bool>,
        startHour: Binding<Int>,
        endHour: Binding<Int>,
        onComplete: @escaping (Int, Int) -> Void
    ) -> DualPickerBottomSheet {
        DualPickerBottomSheet(
            isPresented: isPresented,
            firstValue: startHour,
            secondValue: endHour,
            title: "교실 이동 시간을 선택해주세요",
            firstLabel: "교시",
            secondLabel: "교시",
            firstRange: 5...12,
            secondRange: 5...12,
            buttonText: "신청하기",
            onComplete: onComplete
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
