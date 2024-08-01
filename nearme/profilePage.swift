//
//  profilePage.swift
//  nearme
//
//  Created by Scholar on 7/30/24.
//

import SwiftUI

struct profilePage: View {
    @State private var name = ""
    @State private var bio = ""
    @State private var titleText = "Your Profile Page"
    
    var body: some View {
        
        ZStack {
            // Lighter gradient background
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.8)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all) // Extend gradient to the edges of the screen
            
            
            
            VStack {
                
                    
                    Text(titleText)
                        .font(.title)
                        .multilineTextAlignment(.center)
                    
                        .frame(maxWidth: .infinity, maxHeight: 100)
                    
                    Image ("userPic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .padding(.bottom, 20)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                    // User details section
                    
                    TextField(" ⌨️ Type name here...", text: $name)
                        .multilineTextAlignment(.center)
                        .font(.callout)
                        .cornerRadius(15.0)
                        .border(Color.purple, width: 1)
                    
                    
                    
                    TextField(" ⌨️ Type bio here...", text: $bio)
                        
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .border(Color.purple, width: 1)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .font(.callout)
                    
                    Button("Submit Profile Details") {
                        titleText = "\(name)'s Profile Page!"
                        
                    }
                    .font(.subheadline)
                    .buttonStyle(.borderedProminent)
                    
                    
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(Color(UIColor.systemBackground)))
                .shadow(radius: 3)
                .padding()
                Spacer()
                
                
                
            }
            
        }
        
    }


#Preview {
   profilePage()
}
