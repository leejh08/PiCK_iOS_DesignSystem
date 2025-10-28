import SwiftUI

#Preview {
    PiCKConfirmPopUpPreview()
}

struct PiCKConfirmPopUpPreview: View {
    @State private var showRejectPopUp = false
    @State private var showAcceptPopUp = false
    @State private var actionResult = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("팝업 테스트")
                .pickText(type: .heading4, textColor: .Normal.black)
            
            if !actionResult.isEmpty {
                Text("선택 결과: \(actionResult)")
                    .pickText(type: .body1, textColor: .Primary.primary500)
                    .padding(.bottom, 20)
            }

            Button {
                showRejectPopUp = true
                actionResult = ""
            } label: {
                Text("거절 팝업 열기")
                    .pickText(type: .body1, textColor: .Normal.white)
                    .frame(width: 200, height: 48)
                    .background(Color(red: 1.0, green: 0.33, blue: 0.33))
                    .cornerRadius(8)
            }

            Button {
                showAcceptPopUp = true
                actionResult = ""
            } label: {
                Text("수락 팝업 열기")
                    .pickText(type: .body1, textColor: .Normal.white)
                    .frame(width: 200, height: 48)
                    .background(Color(red: 0.6, green: 0.4, blue: 1.0))
                    .cornerRadius(8)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.Normal.black)
        .confirmPopUp(
            title: "2301 강해민 외 4명의 외출을 거절하시겠습니까?",
            explain: "확인 시 2301 강해민 외 4명에게 알림이 전송됩니다.",
            type: .reject,
            isPresented: $showRejectPopUp
        ) { action in
            switch action {
            case .accept:
                actionResult = "거절 확인"
            case .cancel:
                actionResult = "거절 취소"
            }
        }
        .confirmPopUp(
            title: "2301 강해민 외 4명의 외출을 수락하시겠습니까?",
            explain: "확인 시 2301 강해민 외 4명에게 알림이 전송됩니다.",
            type: .accept,
            isPresented: $showAcceptPopUp
        ) { action in
            switch action {
            case .accept:
                actionResult = "수락 확인"
            case .cancel:
                actionResult = "수락 취소"
            }
        }
    }
}
