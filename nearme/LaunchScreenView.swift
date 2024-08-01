import SwiftUI

struct LaunchScreenView: View {
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
                    NavigationLink(destination: navbarView()) {
                    Button(action: {
                        // Handle login action here
                        print("Logging in with username: \(username) and password: \(password)")
                    }) {
                    }
                        
                            Text("Login")
                                .font(.headline)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
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
                        NavigationLink(destination: signup()) {
                            Text("Sign Up")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding(.top, 10)
                        }
                        
                        Spacer()
                    }
                    .padding()
                }
            }
        }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}




