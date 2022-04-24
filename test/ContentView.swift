import SwiftUI
extension Image {
    func asyncImageModifier() -> some View {
        self
            .resizable()
            .padding()
            .scaledToFit()
            .ignoresSafeArea()
    }
    func iconModifier() -> some View {
        self
            .asyncImageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(Color.purple)
            .opacity(0.5)
    }
}
struct ContentView: View {
    private let imageUrl: String = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
        //MARK: - 1 Image Phases
        AsyncImage(url: URL(string: imageUrl)){ phase in
            if let image = phase.image {
                image.asyncImageModifier()
            } else if phase.error != nil {
                VStack {
                    Image(systemName: "ant.circle.fill").iconModifier()
                    Text("Image loading error 🥺")
                }
            } else {
                VStack {
                    Image(systemName: "photo.circle.fill").iconModifier()
                    Text("Loading Image")
                }
            }
        }.padding(40)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

