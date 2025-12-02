import SwiftUI
import PiCK_iOS_DesignSystem

public struct ClassroomFilterButton: View {
    let selectedClassroom: String
    let onTap: () -> Void

    public var body: some View {
        Button {
            onTap()
        } label: {
            HStack(spacing: 4) {
                Text(selectedClassroom)
                    .pickText(type: .body2, textColor: .Normal.black)

                Image(systemName: "chevron.down")
                    .font(.system(size: 10))
                    .foregroundColor(.Normal.black)
            }
            .padding(.horizontal, 12)
            .frame(height: 36)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.Gray.gray200, lineWidth: 1)
            )
        }
    }
}

private struct PreviewWrapper: View {
    @State private var firstValue = "전체"
    @State private var secondValue = "전체"
    @State private var isApplyBottomSheetPresented = false

    var body: some View {
        ClassroomFilterButton(
            selectedClassroom: "\(firstValue)-\(secondValue)",
            onTap: { isApplyBottomSheetPresented = true }
        )
        .sheet(isPresented: $isApplyBottomSheetPresented) {
            AnyView(
                DualPickerBottomSheet(
                    isPresented: $isApplyBottomSheetPresented,
                    firstValue: $firstValue,
                    secondValue: $secondValue,
                    title: "선택",
                    firstLabel: "학년",
                    secondLabel: "반",
                    firstOptions: ["전체", "1", "2", "3"],
                    secondOptions: ["전체", "1", "2", "3", "4"],
                    onComplete: { first, second in
                        if first == "전체" || second == "전체" {
                            firstValue = "전체"
                            secondValue = "전체"
                        } else {
                            firstValue = first
                            secondValue = second
                        }
                    }
                )
            )
        }
    }
}

#Preview {
    PreviewWrapper()
}
