import SwiftUI

#Preview("PiCK Color System") {
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
            
            // Background Colors
            ColorSectionView(
                title: "Background",
                colors: [
                    ("Light", Color.Background.light),
                    ("Dark", Color.Background.dark)
                ]
            )
            
            // Error Colors
            ColorSectionView(
                title: "Error",
                colors: [
                    ("Light", Color.Error.light),
                    ("Dark", Color.Error.dark)
                ]
            )
            
            // Main Colors (Light)
            ColorSectionView(
                title: "Main (Light)",
                colors: [
                    ("Main 50", Color.Main2.main50),
                    ("Main 100", Color.Main2.main100),
                    ("Main 200", Color.Main2.main200),
                    ("Main 300", Color.Main2.main300),
                    ("Main 400", Color.Main2.main400),
                    ("Main 500", Color.Main2.main500),
                    ("Main 600", Color.Main2.main600),
                    ("Main 700", Color.Main2.main700),
                    ("Main 800", Color.Main2.main800),
                    ("Main 900", Color.Main2.main900)
                ]
            )
            
            // Main Colors (Dark)
            ColorSectionView(
                title: "Main (Dark)",
                colors: [
                    ("Dark Main 50", Color.Main2.darkMain50),
                    ("Dark Main 100", Color.Main2.darkMain100),
                    ("Dark Main 200", Color.Main2.darkMain200),
                    ("Dark Main 300", Color.Main2.darkMain300),
                    ("Dark Main 400", Color.Main2.darkMain400),
                    ("Dark Main 500", Color.Main2.darkMain500),
                    ("Dark Main 600", Color.Main2.darkMain600),
                    ("Dark Main 700", Color.Main2.darkMain700),
                    ("Dark Main 800", Color.Main2.darkMain800),
                    ("Dark Main 900", Color.Main2.darkMain900)
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
