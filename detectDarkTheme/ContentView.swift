
import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let title: String
    let subTitle: String
    let icon: String
}



extension Color {
    
    //light theme
    static let lightBackground = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
    static let lightShadow = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255) // opacity 0.5
    static let darkShadow = Color(red: 163 / 255, green: 177 / 255, blue: 198 / 255)
    
    //dark theme
    static let darkBackground = Color(red: 78 / 255, green: 78 / 255, blue: 80 / 255)
}

var cards = [
    Card(title: "Title", subTitle: "Subtitle", icon: "heart")
]



struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
