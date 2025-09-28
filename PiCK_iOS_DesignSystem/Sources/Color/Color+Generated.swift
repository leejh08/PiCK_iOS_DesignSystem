// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum PiCKColor {
  internal enum Background {
    internal static let background = ColorAsset(name: "background")
  }
  internal enum Error {
    internal static let error = ColorAsset(name: "error")
  }
  internal enum Gray {
    internal static let gray100 = ColorAsset(name: "gray100")
    internal static let gray200 = ColorAsset(name: "gray200")
    internal static let gray300 = ColorAsset(name: "gray300")
    internal static let gray400 = ColorAsset(name: "gray400")
    internal static let gray50 = ColorAsset(name: "gray50")
    internal static let gray500 = ColorAsset(name: "gray500")
    internal static let gray600 = ColorAsset(name: "gray600")
    internal static let gray700 = ColorAsset(name: "gray700")
    internal static let gray800 = ColorAsset(name: "gray800")
    internal static let gray900 = ColorAsset(name: "gray900")
  }
  internal enum Main {
    internal static let main100 = ColorAsset(name: "main100")
    internal static let main200 = ColorAsset(name: "main200")
    internal static let main300 = ColorAsset(name: "main300")
    internal static let main400 = ColorAsset(name: "main400")
    internal static let main50 = ColorAsset(name: "main50")
    internal static let main500 = ColorAsset(name: "main500")
    internal static let main600 = ColorAsset(name: "main600")
    internal static let main700 = ColorAsset(name: "main700")
    internal static let main800 = ColorAsset(name: "main800")
    internal static let main900 = ColorAsset(name: "main900")
  }
  internal enum ModeColor {
    internal static let modeBlack = ColorAsset(name: "modeBlack")
    internal static let modeWhite = ColorAsset(name: "modeWhite")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public struct ColorAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  public var color: Color {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  public func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIColor: SwiftUI.Color {
    SwiftUI.Color(asset: self)
  }
  #endif
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
