import SwiftUI
import PiCK_iOS_DesignSystem

public struct ClassroomFilterButton: View {
    public let selectedClassroom: String
    public let onTap: () -> Void

    public init(
        selectedClassroom: String,
        onTap: @escaping () -> Void
    ) {
        self.selectedClassroom = selectedClassroom
        self.onTap = onTap
    }

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
        ZStack {
            ClassroomFilterButton(
                selectedClassroom: "\(firstValue)-\(secondValue)",
                onTap: { isApplyBottomSheetPresented = true }
            )

            if isApplyBottomSheetPresented {
                GeometryReader { geometry in
                    ZStack(alignment: .bottom) {
                        Color.black.opacity(0.4)
                            .ignoresSafeArea()
                            .onTapGesture {
                                isApplyBottomSheetPresented = false
                            }
                        
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
                        .frame(height: geometry.size.height * 0.45)
                        .transition(.move(edge: .bottom))
                    }
                    .ignoresSafeArea()
                }
            }
        }
        .animation(.easeInOut(duration: 0.45), value: isApplyBottomSheetPresented)
    }
}

#Preview {
    PreviewWrapper()
}
