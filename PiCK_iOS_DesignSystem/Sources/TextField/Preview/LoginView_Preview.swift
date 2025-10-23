
import SwiftUI

struct LoginView: View {
    @State private var id: String = ""
    @State private var pass: String = ""

    var body: some View {
        VStack(spacing: 20) {
            PiCKTextField(
                text: $id,
                placeholder: "아이디",
                titleText: "아이디"
            )
            PiCKTextField(
                text: $pass,
                placeholder: "비밀번호",
                titleText: "비밀번호",
                isSecurity: true
            )
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
