import SwiftUI

#Preview("Selection BottomSheet") {
    ApplyBottomSheetPreviewContainer()
}

private struct ApplyBottomSheetPreviewContainer: View {
    @State private var isPresented = true
    @State private var selectedOption: String = ""

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    isPresented = false
                }

            VStack {
                if !selectedOption.isEmpty {
                    Text("선택됨: \(selectedOption)")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                }
                Spacer()
            }
            .padding(.top, 100)

            if isPresented {
                SinglePickerBottomSheet(
                    isPresented: $isPresented,
                    title: "수락할 활동을 선택해주세요",
                    options: ["외출 수락", "교실 이동"]
                ) { option in
                    selectedOption = option
                }
                .transition(.move(edge: .bottom))
                .animation(.easeInOut(duration: 0.3), value: isPresented)
            }
        }
        .ignoresSafeArea(edges: .bottom)
        .overlay(alignment: .topTrailing) {
            Button("다시 열기") {
                isPresented = true
            }
            .padding()
            .opacity(isPresented ? 0 : 1)
        }
    }
}
