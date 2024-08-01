import SwiftUI

struct ContentViewScreen: View {
    @State private var isLaunchScreenShown = true
    
    var body: some View {
        Group {
            if isLaunchScreenShown {
                LaunchScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            withAnimation {
                                self.isLaunchScreenShown = false
                            }
                        }
                    }
            } else {
                MainView() // Replace with your main app view
            }
        }
    }
}

struct MainView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var showingSignUp = false

    var body: some View {
        NavigationView {
            ZStack {
                // Background Gradient
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // Title
                    Text("NearMe")
                        .padding(.bottom, 10)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                
                    Text("Login")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                        .padding(.top, 140)
                    
                    // Username Field
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color(.systemGray6).opacity(0.7))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                        .autocapitalization(.none)
                    
                    // Password Field with Show/Hide Icon
                    HStack {
                        if isPasswordVisible {
                            TextField("Password", text: $password)
                        } else {
                            SecureField("Password", text: $password)
                        }
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6).opacity(0.7))
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                    
                    // Login Button
                    Button(action: {
                        // Handle login action here
                        print("Logging in with username: \(username) and password: \(password)")
                    }) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.blue)
                            .cornerRadius(15.0)
                    }
                    .padding(.top, 20)
                    
                    // Forgot Password Button
                    Button(action: {
                        // Handle forgot password action here
                        print("Forgot Username/Password")
                    }) {
                        Text("Forgot Username/Password?")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 20)
                    
                    // Sign Up Button
                    NavigationLink(destination: signup(), isActive: $showingSignUp) {
                        Button(action: {
                            self.showingSignUp = true
                        }) {
                            Text("Sign Up")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding(.top, 10)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}
