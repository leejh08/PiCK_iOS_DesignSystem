# PiCK iOS Design System

<div align="center">

**PiCK 서비스를 위한 SwiftUI 기반 디자인 시스템 라이브러리**

[![Swift](https://img.shields.io/badge/Swift-5.5+-F05138?style=flat&logo=swift&logoColor=white)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS%2015.0+-000000?style=flat&logo=apple&logoColor=white)](https://developer.apple.com/ios/)
[![SPM](https://img.shields.io/badge/SPM-Compatible-4BC51D?style=flat&logo=swift&logoColor=white)](https://swift.org/package-manager/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](LICENSE)

</div>

## 📋 목차

- [소개](#-소개)
- [주요 기능](#-주요-기능)
- [요구사항](#-요구사항)
- [설치 방법](#-설치-방법)
- [컴포넌트](#-컴포넌트)
- [사용 예제](#-사용-예제)
- [라이선스](#-라이선스)

## 📖 소개

PiCK iOS Design System은 PiCK 서비스의 일관된 UI/UX를 제공하기 위한 SwiftUI 기반 디자인 시스템입니다.
재사용 가능한 컴포넌트, 타이포그래피, 컬러 시스템을 제공하여 빠르고 일관된 개발을 지원합니다.

## ✨ 주요 기능

- 🎨 **통합 디자인 토큰**: 컬러, 타이포그래피, 스페이싱 등 일관된 디자인 요소
- 🧩 **재사용 가능한 컴포넌트**: 버튼, 텍스트 필드, 바텀시트, 팝업 등
- 📱 **SwiftUI 네이티브**: 최신 SwiftUI 기반으로 개발된 컴포넌트
- 🔍 **프리뷰 지원**: 모든 컴포넌트에 Xcode Preview 제공
- 🎭 **커스텀 리소스**: 폰트, 이미지, 애니메이션 포함

## 📱 요구사항

- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

## 📦 설치 방법

### Swift Package Manager

1. Xcode에서 **File > Add Packages...** 선택
2. 다음 URL을 입력:
```
https://github.com/DSM-PICK/PiCK_iOS_DesignSystem.git
```
3. **Dependency Rule**에서 버전 선택
4. **Add Package** 클릭

### Package.swift에 직접 추가

```swift
dependencies: [
    .package(
        url: "https://github.com/DSM-PICK/PiCK_iOS_DesignSystem.git",
        from: "1.0.0"
    )
]
```

그리고 target의 dependencies에 추가:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "PiCK_iOS_DesignSystem", package: "PiCK_iOS_DesignSystem")
    ]
)
```

## 🎨 컴포넌트

### 📐 Foundation

#### Color System
```swift
import PiCK_iOS_DesignSystem

// Primary Colors
Color.primary50
Color.primary100
Color.primary200
// ... primary300 ~ primary800

// Background Colors
Color.background

// Error Colors
Color.error

// Gray Scale
Color.gray50
Color.gray100
// ... gray200 ~ gray900
```

#### Typography
```swift
import PiCK_iOS_DesignSystem

PiCKText("타이틀", type: .heading1(.semibold))
PiCKText("본문", type: .body1(.medium))
PiCKText("캡션", type: .caption1(.regular))
```

**사용 가능한 타입:**
- `heading1`, `heading2`, `heading3`, `heading4`
- `subtitle1`, `subtitle2`, `subtitle3`
- `body1`, `body2`
- `button1`, `button2`
- `caption1`, `caption2`

**사용 가능한 굵기:** `.regular`, `.medium`, `.semibold`, `.bold`

#### Images
```swift
import PiCK_iOS_DesignSystem

PiCKImage.logo
PiCKImage.iconName
```

### 🧩 Components

#### Button
```swift
// Default Button
PiCKButton(
    text: "확인",
    buttonType: .green,
    buttonSize: .full
) {
    // Action
}

// Underline Button
PiCKUnderlineButton(
    text: "더보기",
    type: .purple
) {
    // Action
}
```

#### TextField
```swift
PiCKTextField(
    placeholder: "아이디를 입력하세요",
    text: $username,
    errorMessage: errorMessage,
    isSecure: false
)
```

#### Bottom Sheet

**Apply Bottom Sheet**
```swift
ApplyBottomSheet(
    subTitle: "외출 신청",
    title: "외출 신청을 하시겠습니까?",
    buttonText: "신청하기",
    isShowing: $isShowingSheet
) {
    // 확인 버튼 액션
}
```

**Dual Picker Bottom Sheet**
```swift
DualPickerBottomSheet(
    title: "시간 선택",
    startTime: $startTime,
    endTime: $endTime,
    isShowing: $isShowingPicker
) {
    // 선택 완료 액션
}
```

#### Pop Up
```swift
PiCKConfirmPopUp(
    isShowing: $isShowingPopup,
    title: "알림",
    subTitle: "정말 삭제하시겠습니까?",
    cancelButtonText: "취소",
    confirmButtonText: "확인",
    popupType: .green
) {
    // 확인 버튼 액션
}
```

#### Toast
```swift
PiCKErrorToast(
    text: "오류가 발생했습니다",
    isShowing: $isShowingToast
)
```

#### Navigation Bar
```swift
PiCKMainNavigationBar(
    backButton: {
        // 뒤로가기 액션
    },
    content: {
        Text("페이지 제목")
    }
)
```

#### Calendar
```swift
PiCKCalendarView(selectedDate: $selectedDate)
```

#### Cells
```swift
// 학생 수락 셀
PiCKAcceptStudentCell(
    name: "홍길동",
    studentNumber: "3학년 1반 5번"
)

// 교실 이동 셀
PiCKClassroomMoveCell(
    period: "1교시",
    className: "3-1",
    teacher: "김선생님"
)
```

#### Filter Button
```swift
ClassroomFilterButton(
    selectedClassNumber: $selectedClass,
    classroomList: ["전체", "1반", "2반", "3반", "4반"]
)
```

## 💡 사용 예제

### 기본 사용 예제

```swift
import SwiftUI
import PiCK_iOS_DesignSystem

struct ContentView: View {
    @State private var username = ""
    @State private var isShowingSheet = false

    var body: some View {
        VStack(spacing: 20) {
            PiCKText("PiCK", type: .heading1(.bold))
                .foregroundColor(.primary500)

            PiCKTextField(
                placeholder: "아이디",
                text: $username
            )

            PiCKButton(
                text: "로그인",
                buttonType: .green,
                buttonSize: .full
            ) {
                print("로그인 버튼 클릭")
            }
        }
        .padding()
        .background(Color.background)
    }
}
```

### Bottom Sheet 예제

```swift
import SwiftUI
import PiCK_iOS_DesignSystem

struct ExampleView: View {
    @State private var isShowingSheet = false

    var body: some View {
        VStack {
            PiCKButton(
                text: "외출 신청",
                buttonType: .green,
                buttonSize: .full
            ) {
                isShowingSheet = true
            }
        }
        .background(
            ApplyBottomSheet(
                subTitle: "외출",
                title: "외출 신청을 하시겠습니까?",
                buttonText: "신청하기",
                isShowing: $isShowingSheet
            ) {
                // 신청 로직
                isShowingSheet = false
            }
        )
    }
}
```

## 📄 라이선스

이 프로젝트는 MIT 라이선스로 배포됩니다. 자세한 내용은 [LICENSE](LICENSE) 파일을 참조하세요.

---

<div align="center">

**Made with ❤️ by DSM PiCK Team**

[Report Bug](../../issues) · [Request Feature](../../issues)

</div>
