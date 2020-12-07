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
    static let textColor = Color(red: 78 / 255, green: 78 / 255, blue: 80 / 255)
    //dark theme
    static let darkBackground = Color(red: 78 / 255, green: 78 / 255, blue: 80 / 255)
}

var cards = [
    Card(title: "Notifications", subTitle: "One advanced diverted domestic sex repeated bringing you old. Possible procured her trifling laughter thoughts property she met way. Companions shy had solicitude favourable own. Which could saw guest man now heard but", icon: "bell.fill"),
    Card(title: "Favourites", subTitle: "One advanced diverted domestic sex repeated bringing you old. Possible procured her trifling laughter thoughts property she met way. Companions shy had solicitude favourable own. Which could saw guest man now heard but", icon: "heart.fill"),
    Card(title: "Dashboard", subTitle: "One advanced diverted domestic sex repeated bringing you old. Possible procured her trifling laughter thoughts property she met way. Companions shy had solicitude favourable own. Which could saw guest man now heard but", icon: "square.grid.2x2.fill"),
    Card(title: "User", subTitle: "One advanced diverted domestic sex repeated bringing you old. Possible procured her trifling laughter thoughts property she met way. Companions shy had solicitude favourable own. Which could saw guest man now heard but", icon: "person.fill"),
    Card(title: "Messages", subTitle: "One advanced diverted domestic sex repeated bringing you old. Possible procured her trifling laughter thoughts property she met way. Companions shy had solicitude favourable own. Which could saw guest man now heard but", icon: "message.fill"),
    Card(title: "Economy", subTitle: "One advanced diverted domestic sex repeated bringing you old. Possible procured her trifling laughter thoughts property she met way. Companions shy had solicitude favourable own. Which could saw guest man now heard but", icon: "leaf.fill")
]

struct NeumorphicText: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
            content
                .foregroundColor(colorScheme == .light ? Color.textColor : Color.white)

    }
}

struct NeumorphicLook: ViewModifier {
    
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(.textColor)
            .background(colorScheme == .light ? Color.lightBackground : Color.textColor)
            .cornerRadius(25)
            .shadow(color: colorScheme == .light ? Color.lightShadow :  Color.lightShadow.opacity(0.3), radius: 12, x: -7, y: -7)
            .shadow(color: colorScheme == .light ? Color.darkShadow : Color.black.opacity(0.5), radius: 12, x: 7, y: 7)
        
    }
}
extension View {
    func neumorphicLook() -> some View {
        modifier(NeumorphicLook())
    }
    
    func neumorphicText() -> some View {
        modifier(NeumorphicText())
    }
}

// textField

struct NeumorphicStyleTextField: View {
    @Environment(\.colorScheme) var colorScheme
    var textField: TextField<Text>
    var imageName: String
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(colorScheme == .light ? Color.textColor : Color.white)
            textField
            }
        .neumorphicLook()
        }
}



//Card
struct CardView: View {
    @Environment(\.colorScheme) var colorScheme
    var title: String
    var subtitle: String
    var image: String
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image(systemName: image)
                    .neumorphicText()
                    .font(.title2)
                Text(title).font(.title)
                    .neumorphicText()
                Spacer()
            }
            Text(subtitle).font(.subheadline)
                .neumorphicText()
        }.neumorphicLook()
        
    }
}

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var search = ""
    
    var body: some View {
        ZStack {
            colorScheme == .light ? Color.lightBackground.ignoresSafeArea() : Color.textColor.ignoresSafeArea()
            ScrollView {
                HStack {
                    Image(systemName: "line.horizontal.3.decrease").neumorphicText().neumorphicLook()
                    Spacer()
                    Image(colorScheme == .light ? "logoDark" : "logoLight")
                        .resizable()
                        .frame(width: 150, height: 40)
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                    Image(systemName: "slider.horizontal.3").neumorphicText().neumorphicLook()
                }.padding(.horizontal)
                HStack {
                    NeumorphicStyleTextField(textField: TextField("Search...", text: $search), imageName: "magnifyingglass")
                }.padding()
                VStack(spacing: 5) {
                    ForEach(cards) { c in
                        CardView(title: c.title, subtitle: c.subTitle, image: c.icon)
                    }.padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
