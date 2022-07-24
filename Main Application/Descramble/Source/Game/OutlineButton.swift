import SwiftUI

/// Displays a titled button that occupies the full width of the screen with a rounded border.
struct OutlineButton: View {
    let titleKey: LocalizedStringKey
    let textColor: Color
    let borderColor: Color
    let borderWidth: CGFloat
    let cornerRadius: CGFloat
    let action: (() -> Void)

    init(appStringKey: AppStringKeys,
         textColor: Color = .primaryText,
         borderColor: Color = .primaryText,
         borderWidth: CGFloat = 3,
         cornerRadius: CGFloat = 8,
         action: @escaping (() -> Void)) {
        self.titleKey = appStringKey.stringKey
        self.textColor = textColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
        self.action = action
    }

    var body: some View {
        HStack {
            Button(action: action) {
                Text(titleKey)
                    .font(.title)
                    .foregroundColor(textColor)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .border(borderColor, width: borderWidth)
        .cornerRadius(cornerRadius)
    }
}

struct OutlineButton_Previews: PreviewProvider {
    static var previews: some View {
        OutlineButton(appStringKey: .playAgain, action: { })
    }
}
