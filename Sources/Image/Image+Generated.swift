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
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum PiCKImage {
  internal enum Logo {
    internal static let onboardingLogo = ImageAsset(name: "onboardingLogo")
    internal static let pickLogo = ImageAsset(name: "pickLogo")
  }
  internal enum MainIcon {
    internal static let outing = ImageAsset(name: "Outing")
    internal static let alert = ImageAsset(name: "alert")
    internal static let bottomArrow = ImageAsset(name: "bottomArrow")
    internal static let bug = ImageAsset(name: "bug")
    internal static let calendar = ImageAsset(name: "calendar")
    internal static let changePassword = ImageAsset(name: "changePassword")
    internal static let check = ImageAsset(name: "check")
    internal static let classRoomMove = ImageAsset(name: "classRoomMove")
    internal static let defaultTimeTable1 = ImageAsset(name: "defaultTimeTable1")
    internal static let displayMode = ImageAsset(name: "displayMode")
    internal static let earlyLeave = ImageAsset(name: "earlyLeave")
    internal static let eyeOff = ImageAsset(name: "eyeOff")
    internal static let eyeOn = ImageAsset(name: "eyeOn")
    internal static let fail = ImageAsset(name: "fail")
    internal static let image = ImageAsset(name: "image")
    internal static let leftArrow = ImageAsset(name: "leftArrow")
    internal static let logout = ImageAsset(name: "logout")
    internal static let main = ImageAsset(name: "main")
    internal static let myPage = ImageAsset(name: "myPage")
    internal static let navigationSetting = ImageAsset(name: "navigationSetting")
    internal static let newNotice = ImageAsset(name: "newNotice")
    internal static let notice = ImageAsset(name: "notice")
    internal static let profile = ImageAsset(name: "profile")
    internal static let rightArrow = ImageAsset(name: "rightArrow")
    internal static let smile = ImageAsset(name: "smile")
    internal static let studentIdCard = ImageAsset(name: "studentIdCard")
    internal static let time = ImageAsset(name: "time")
    internal static let topArrow = ImageAsset(name: "topArrow")
    internal static let voice = ImageAsset(name: "voice")
    internal static let weekendMeal = ImageAsset(name: "weekendMeal")
  }
  internal enum TabbarIcon {
    internal static let allTabIcon = ImageAsset(name: "allTabIcon")
    internal static let applyIcon = ImageAsset(name: "applyIcon")
    internal static let homeIcon = ImageAsset(name: "homeIcon")
    internal static let scheduleIcon = ImageAsset(name: "scheduleIcon")
    internal static let schoolMealIcon = ImageAsset(name: "schoolMealIcon")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public struct ImageAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  public var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  public func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif

  public init(name: String) {
    self.name = name
  }
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
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
