import SwiftUI

struct ClassroomBottomSheetPreviewWrapper: View {
    @State private var isPresented = false
    @State private var grade = 1
    @State private var classNumber = 1

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("Selected Grade: \(grade), Class: \(classNumber)")
                    .font(.headline)

                Button("Show Classroom Bottom Sheet") {
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
                        
                        ClassroomBottomSheet(
                            isPresented: $isPresented,
                            grade: $grade,
                            class: $classNumber,
                            onComplete: {_,_ in 
                                isPresented = false
                            }
                        )
                    }
                    .ignoresSafeArea()
                }
            }
        }
    }
}

#Preview {
    ClassroomBottomSheetPreviewWrapper()
}
