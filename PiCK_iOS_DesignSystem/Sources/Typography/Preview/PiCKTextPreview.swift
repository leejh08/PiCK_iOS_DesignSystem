import SwiftUI
import ColorSync

public struct PiCKTextPreview: View {
    public init() {}
    
    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Group {
                    Text("Heading 1 - 42px SemiBold")
                        .pickText(type: .heading1)
                    
                    Text("Heading 2 - 32px SemiBold")
                        .pickText(type: .heading2)
                    
                    Text("Heading 3 - 24px SemiBold")
                        .pickText(type: .heading3)
                    
                    Text("Heading 4 - 20px SemiBold")
                        .pickText(type: .heading4)
                }
                
                Group {
                    Text("Sub Title 1 - 18px SemiBold")
                        .pickText(type: .subTitle1)
                    
                    Text("Sub Title 2 - 16px SemiBold")
                        .pickText(type: .subTitle2)
                    
                    Text("Sub Title 3 - 14px SemiBold")
                        .pickText(type: .subTitle3)
                }
                
                Group {
                    Text("Body 1 - 14px Medium")
                        .pickText(type: .body1)
                    
                    Text("Body 2 - 12px Medium")
                        .pickText(type: .body2)
                    
                    Text("Body 3 - 10px Medium")
                        .pickText(type: .body3)
                }
                
                Group {
                    Text("Caption 1 - 16px Regular")
                        .pickText(type: .caption1)
                    
                    Text("Caption 2 - 12px Regular")
                        .pickText(type: .caption2)
                }
                
                Group {
                    Text("Label 1 - 16px Medium")
                        .pickText(type: .label1)
                    
                    Text("Label 2 - 12px Medium")
                        .pickText(type: .label2)
                }
                
                Group {
                    Text("Button 1 - 16px SemiBold")
                        .pickText(type: .button1)
                    
                    Text("Button 2 - 12px SemiBold")
                        .pickText(type: .button2)
                }
                
                Divider()
                
            }
            .padding()
        }
        .navigationTitle("PiCK Typography")
    }
}

#Preview {
    PiCKTextPreview()
}
