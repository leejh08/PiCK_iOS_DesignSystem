import SwiftUI

struct PiCKErrorToast_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Main Content")
        }
        .errorToast(message: "에러가 발생했습니다", isPresented: .constant(true))
    }
}
