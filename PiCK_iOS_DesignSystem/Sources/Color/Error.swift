import SwiftUI

public extension Color {
    struct Error { }
}

// MARK: - Error Color
public extension Color.Error {
    static let error = Color("error", bundle: .module)
}
