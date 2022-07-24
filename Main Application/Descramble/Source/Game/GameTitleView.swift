import SwiftUI

/// Displays the app's title along with an iconic image to the left of the text.
struct GameTitleView: View {
    var body: some View {
        HStack {
            Image(imageKey: ImageBook.shuffle)
                .imageScale(.large)
            Text(AppStringKeys.appTitle)
                .font(.largeTitle)
        }
    }
}

struct GameTitleView_Previews: PreviewProvider {
    static var previews: some View {
        GameTitleView()
    }
}
