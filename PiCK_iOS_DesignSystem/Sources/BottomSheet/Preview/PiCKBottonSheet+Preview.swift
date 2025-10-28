import SwiftUI

#Preview("Selection BottomSheet") {
    PiCKSelectionBottomSheetPreviewContainer()
}

private struct PiCKSelectionBottomSheetPreviewContainer: View {
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
                PiCKSelectionBottomSheet(
                    isPresented: $isPresented
                ) { option in
                    switch option {
                    case .outgoing:
                        selectedOption = "외출 수락"
                    case .classroomMove:
                        selectedOption = "교실 이동"
                    }
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
