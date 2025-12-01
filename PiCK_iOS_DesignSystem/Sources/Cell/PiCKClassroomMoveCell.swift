import SwiftUI

public struct PiCKClassroomMoveCell: View {
    public var studentNumber: String
    public var studentName: String
    public var startPeriod: Int
    public var endPeriod: Int
    public var currentClassroom: String
    public var moveToClassroom: String
    public var isSelected: Bool
    public var onTap: () -> Void

    public init(
        studentNumber: String,
        studentName: String,
        startPeriod: Int,
        endPeriod: Int,
        currentClassroom: String,
        moveToClassroom: String,
        isSelected: Bool = false,
        onTap: @escaping () -> Void
    ) {
        self.studentNumber = studentNumber
        self.studentName = studentName
        self.startPeriod = startPeriod
        self.endPeriod = endPeriod
        self.currentClassroom = currentClassroom
        self.moveToClassroom = moveToClassroom
        self.isSelected = isSelected
        self.onTap = onTap
    }

    public var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 12) {
                    Text("\(studentNumber) \(studentName)")
                        .pickText(type: .subTitle3, textColor: .Normal.black)

                    Spacer()

                    Text("\(startPeriod)교시 - \(endPeriod)교시")
                        .pickText(type: .body2, textColor: .Gray.gray900)
                }
                .padding(.top, 12)
                .padding(.horizontal, 16)

                Text("\(currentClassroom) → \(moveToClassroom)")
                    .pickText(type: .body2, textColor: .Gray.gray900)
                    .padding(.top, 10)
                    .padding(.horizontal, 16)

                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 79)
            .background(Color.Gray.gray50)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(borderColor, lineWidth: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }

    private var borderColor: Color {
        isSelected ? .Primary.primary500 : .clear
    }
}
