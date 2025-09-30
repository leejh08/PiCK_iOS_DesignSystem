import SwiftUI

struct ColorPreviewContent: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Normal Colors
                ColorSectionView(
                    title: "Normal",
                    colors: [
                        ("White", Color.Normal.white),
                        ("Black", Color.Normal.black)
                    ]
                )
                
                // Background Color
                ColorSectionView(
                    title: "Background",
                    colors: [
                        ("BG", Color.Background.background)
                    ]
                )
                
                // Error Color
                ColorSectionView(
                    title: "Error",
                    colors: [
                        ("Error", Color.Error.error)
                    ]
                )
                
                // Primary Colors
                ColorSectionView(
                    title: "Primary",
                    colors: [
                        ("Primary 50", Color.Primary.primary50),
                        ("Primary 100", Color.Primary.primary100),
                        ("Primary 200", Color.Primary.primary200),
                        ("Primary 300", Color.Primary.primary300),
                        ("Primary 400", Color.Primary.primary400),
                        ("Primary 500", Color.Primary.primary500),
                        ("Primary 600", Color.Primary.primary600),
                        ("Primary 700", Color.Primary.primary700),
                        ("Primary 800", Color.Primary.primary800),
                        ("Primary 900", Color.Primary.primary900)
                    ]
                )
                
                // Gray Colors
                ColorSectionView(
                    title: "Gray",
                    colors: [
                        ("Gray 50", Color.Gray.gray50),
                        ("Gray 100", Color.Gray.gray100),
                        ("Gray 200", Color.Gray.gray200),
                        ("Gray 300", Color.Gray.gray300),
                        ("Gray 400", Color.Gray.gray400),
                        ("Gray 500", Color.Gray.gray500),
                        ("Gray 600", Color.Gray.gray600),
                        ("Gray 700", Color.Gray.gray700),
                        ("Gray 800", Color.Gray.gray800),
                        ("Gray 900", Color.Gray.gray900)
                    ]
                )
            }
            .padding()
        }
    }
}

#Preview("PiCK Color System Light") {
    ColorPreviewContent()
        .preferredColorScheme(.light)
}

#Preview("PiCK Color System Dark") {
    ColorPreviewContent()
        .preferredColorScheme(.dark)
}

private struct ColorSectionView: View {
    let title: String
    let colors: [(String, Color)]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 4)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 5), spacing: 8) {
                ForEach(Array(colors.enumerated()), id: \.offset) { index, colorData in
                    ColorItemView(name: colorData.0, color: colorData.1)
                }
            }
        }
    }
}

private struct ColorItemView: View {
    let name: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 4) {
            RoundedRectangle(cornerRadius: 8)
                .fill(color)
                .frame(height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                )
            
            Text(name)
                .font(.caption)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
        }
    }
}
