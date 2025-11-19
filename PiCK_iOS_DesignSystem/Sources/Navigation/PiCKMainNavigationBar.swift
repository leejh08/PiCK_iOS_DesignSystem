import SwiftUI

struct PiCKMainNavigationBarView: View {
    var body: some View {
        HStack {
            PiCKImage.pickLogo
                .padding(.leading, 24)

            Spacer()

        }
        .frame(height: 34)
        .background(Color.clear)
    }
}
