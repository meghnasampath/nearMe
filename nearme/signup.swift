import SwiftUI

struct signup: View {
    @State private var showingSignUp = false
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isConfirmPasswordVisible: Bool = false
    
    var body: some View {
      
        NavigationStack {
            
            ZStack {
                // Background Gradient
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                
                
                VStack {
                  
                        Text("Sign Up")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                            .padding(.top, 20)
                        
                        // First Name Field
                        TextField("First Name", text: $firstName)
                            .padding()
                            .background(Color(.systemGray6).opacity(0.7))
                            .cornerRadius(10)
                            .padding(.bottom, 20)
                        
                        // Last Name Field
                        TextField("Last Name", text: $lastName)
                            .padding()
                            .background(Color(.systemGray6).opacity(0.7))
                            .cornerRadius(10)
                            .padding(.bottom, 20)
                        
                        // Phone Number Field
                        TextField("Phone Number", text: $phoneNumber)
                            .padding()
                            .background(Color(.systemGray6).opacity(0.7))
                            .cornerRadius(10)
                            .padding(.bottom, 20)
                            .keyboardType(.phonePad)
                        
                        // Email Field
                        TextField("Email", text: $email)
                            .padding()
                            .background(Color(.systemGray6).opacity(0.7))
                            .cornerRadius(10)
                            .padding(.bottom, 20)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        
                        // Password Field
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
                        
                        // Confirm Password Field
                        HStack {
                            if isConfirmPasswordVisible {
                                TextField("Confirm Password", text: $confirmPassword)
                            } else {
                                SecureField("Confirm Password", text: $confirmPassword)
                            }
                            Button(action: {
                                isConfirmPasswordVisible.toggle()
                            }) {
                                Image(systemName: isConfirmPasswordVisible ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6).opacity(0.7))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                        
                        // Sign Up Button
                        
                        //DO A NAVIGATION TO mainPage AFTER to go to login and sign up!!
                        NavigationLink(destination: navbarView()) {
                            Button(action:  {
                                // Handle sign up action here
                                print("Signing up with email: \(email)")
                            }) {
                                
                            }
                            Text("Sign Up")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 220, height: 60)
                                .background(Color.blue)
                                .cornerRadius(15.0)
                        }
                        .padding(.top, 10)
                        
                       
                    }
                    .padding()
                }
            
            }
        }
}
    
    
    
    
    
    #Preview {
        signup()
    }
    

