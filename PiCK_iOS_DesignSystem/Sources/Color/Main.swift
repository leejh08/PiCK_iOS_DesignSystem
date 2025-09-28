import SwiftUI

public extension Color {
    struct Main { }
}

// MARK: - Main Colors (Light Mode)
public extension Color.Main {
    static let main50:  Color = #colorLiteral(red: 0.9725490196, green: 0.9176470588, blue: 0.9960784314, alpha: 1).color
    static let main100: Color = #colorLiteral(red: 0.8784313725, green: 0.8, blue: 0.9960784314, alpha: 1).color
    static let main200: Color = #colorLiteral(red: 0.7960784314, green: 0.7254901961, blue: 0.9921568627, alpha: 1).color
    static let main300: Color = #colorLiteral(red: 0.7137254902, green: 0.5294117647, blue: 0.9882352941, alpha: 1).color
    static let main400: Color = #colorLiteral(red: 0.6509803922, green: 0.4039215686, blue: 0.9764705882, alpha: 1).color
    static let main500: Color = #colorLiteral(red: 0.5882352941, green: 0.3137254902, blue: 0.9607843137, alpha: 1).color
    static let main600: Color = #colorLiteral(red: 0.5450980392, green: 0.2901960784, blue: 0.9019607843, alpha: 1).color
    static let main700: Color = #colorLiteral(red: 0.5176470588, green: 0.2509803922, blue: 0.8431372549, alpha: 1).color
    static let main800: Color = #colorLiteral(red: 0.4745098039, green: 0.2274509804, blue: 0.7803921569, alpha: 1).color
    static let main900: Color = #colorLiteral(red: 0.4078431373, green: 0.1843137255, blue: 0.7176470588, alpha: 1).color
}

// MARK: - Main Colors (Dark Mode)
public extension Color.Main {
    static let darkMain50:  Color = #colorLiteral(red: 0.5921568627, green: 0.4392156863, blue: 0.9450980392, alpha: 1).color
    static let darkMain100: Color = #colorLiteral(red: 0.6509803922, green: 0.4235294118, blue: 0.9529411765, alpha: 1).color
    static let darkMain200: Color = #colorLiteral(red: 0.6823529412, green: 0.5882352941, blue: 0.9607843137, alpha: 1).color
    static let darkMain300: Color = #colorLiteral(red: 0.7215686275, green: 0.4745098039, blue: 0.9607843137, alpha: 1).color
    static let darkMain400: Color = #colorLiteral(red: 0.7411764706, green: 0.4666666667, blue: 0.9803921569, alpha: 1).color
    static let darkMain500: Color = #colorLiteral(red: 0.7803921569, green: 0.4392156863, blue: 0.9803921569, alpha: 1).color
    static let darkMain600: Color = #colorLiteral(red: 0.8196078431, green: 0.0627450980, blue: 0.9450980392, alpha: 1).color
    static let darkMain700: Color = #colorLiteral(red: 0.8745098039, green: 0.1921568627, blue: 0.8980392157, alpha: 1).color
    static let darkMain800: Color = #colorLiteral(red: 0.9215686275, green: 0.3137254902, blue: 0.9647058824, alpha: 1).color
    static let darkMain900: Color = #colorLiteral(red: 0.9686274510, green: 0.2745098039, blue: 0.9764705882, alpha: 1).color
}
