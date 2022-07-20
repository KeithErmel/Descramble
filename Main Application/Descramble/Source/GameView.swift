import SwiftUI
import EnglishWords

struct GameView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "shuffle")
                    .imageScale(.large)
                Text("Descramble")
                    .font(.largeTitle)
            }
            Text("coming soon…")
                .font(.caption)
        } 
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
