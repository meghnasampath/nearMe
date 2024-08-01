import SwiftUI

struct LaunchScreenView: View {
    @State private var scale: CGFloat = 0.5
    @State private var opacity: Double = 0.0
    @State private var offset: CGFloat = UIScreen.main.bounds.height
    @State private var showTitle = false
    @State private var transitionComplete = false

    var body: some View {
        NavigationView {
            ZStack {
                // Background Gradient
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                // Logo Animation
                if !transitionComplete {
                    VStack {
                        Image("Image") // Ensure this image is added to Assets.xcassets
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .scaleEffect(scale)
                            .opacity(opacity)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.0)) {
                                    self.scale = 1.0
                                    self.opacity = 1.0
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    withAnimation(.easeOut(duration: 1.0)) {
                                        self.scale = 0.5
                                        self.opacity = 0.0
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                        self.showTitle = true
                                    }
                                }
                            }
                        
                        if showTitle {
                            Text("NearMe")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .offset(y: offset)
                                .onAppear {
                                    withAnimation(.easeInOut(duration: 1.5)) {
                                        self.offset = 0
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        self.transitionComplete = true
                                    }
                                }
                        }
                    }
                } else {
                    // After the animation is complete, navigate to another view or show content
                    ContentView() // Replace with your actual content view or logic
                        .transition(.opacity) // Optional: apply transition effect
                }
            }
            .navigationBarHidden(true) // Hide navigation bar if needed
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}




