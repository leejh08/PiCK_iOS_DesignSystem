import SwiftUI

public enum PiCKFontType {

    case heading1
    case heading2
    case heading3
    case heading4

    case subTitle1
    case subTitle2
    case subTitle3

    case body1
    case body2
    case body3

    case caption1
    case caption2

    case label1
    case label2

    case button1
    case button2

}

extension PiCKFontType {

    var fontSize: CGFloat {
        switch self {

        case .heading1: return 42
        case .heading2: return 32
        case .heading3: return 24
        case .heading4: return 20

        case .subTitle1: return 18
        case .subTitle2: return 16
        case .subTitle3: return 14

        case .body1: return 14
        case .body2: return 12
        case .body3: return 10
            
        case .caption1: return 16
        case .caption2: return 12

        case .label1: return 16
        case .label2: return 12

        case .button1: return 16
        case .button2: return 12

        }
    }

    var fontWeight: UIFont.Weight {
        switch self {

        case .heading1, .heading2, .heading3, .heading4: return .semiBold
        case .subTitle1, .subTitle2, .subTitle3: return .semiBold

        case .body1, .body2, .body3: return .medium

        case .caption1, .caption2: return .regular

        case .label1, .label2: return .medium

        case .button1, .button2: return .semiBold

        }
    }

    var lineHeight: CGFloat {
        switch self {

        case .heading1: return 56
        case .heading2: return 42
        case .heading3: return 32
        case .heading4: return 27

        case .subTitle1: return 24
        case .subTitle2: return 21
        case .subTitle3: return 19

        case .body1: return 19
        case .body2: return 16
        case .body3: return 13

        case .caption1: return 21
        case .caption2: return 16

        case .label1: return 21
        case .label2: return 16

        case .button1: return 21
        case .button2: return 16

        }
    }

    var defaultColor: Color {
        switch self {

        case .heading1, .heading2, .heading3, .heading4: return .modeBlack
        case .subTitle1, .subTitle2, .subTitle3: return .modeBlack

        case .body1, .body2, .body3: return .gray700

        case .caption1, .caption2: return .gray600

        case .label1, .label2: return .gray700

        case .button1, .button2: return .modeBlack

        }
    }

}
