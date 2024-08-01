//
//  mainPage.swift
//  nearme
//
//  Created by Scholar on 7/30/24.
//

import SwiftUI
// Event Model
struct Event: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let category: String
    let description: String
    let gender: String
    let numberofpeople: String
    let location: String
    let text2: String
    let date: String
    var isFavorited: Bool = false
}
// ViewModel
class EventViewModel: ObservableObject {
    @Published var events: [Event] = []
    @Published var selectedCategory: String? = nil
    var filteredEvents: [Event] {
        if let category = selectedCategory {
            return events.filter { $0.category == category }
        } else {
            return events
        }
    }
    init() {
        events = [
            Event(title: "Discover Stavros Niarchos Library!", category: "Liberal Arts", description: "Come hang out at the library to discuss books and make bracelets!", gender: " 🌈 Gender: Mixed", numberofpeople: " 👥 Number of people: 20", location: " 📍 Location: 455 5th Ave, New York, NY 10016", text2: "Join to make friends with those who love books just as much as you do!", date: "🗓️ Date: August 14, 2024 | 1pm - 3pm"),
            Event(title: " Explore Volleyball 🏐", category: "Sports", description: "Come play volleyball at Juniper Park and master your volleyball skills.", gender: " 🌈 Gender: Mixed", numberofpeople: " 👥 Number of people: 8", location: " 📍 Location: Juniper Blvd., Lutheran Ave., 71 St, Dry Harbor Rd, Queens, NY 11379", text2: "Join and have fun playing volleyball with other beginners!", date: "🗓️ Date: August 8, 2024 | 3pm - 5pm"),
            Event(title: "NYC Hall of Science Nights!", category: "STEM", description: "Come explore the exhibitions and fun activities at the museum! Kids and teens are welcome.", gender: " 🌈 Gender: Mixed", numberofpeople: " 👥 Number of people: 30", location: "📍 Location: 47-01 111th St, Queens, NY 11368", text2: "Join to discuss the world of STEM with other science-minded people!", date: "🗓️ Date: August 3, 2024 | 5pm - 7pm"),
            Event(title: "Teens Take The Met", category: "Liberal Arts", description: "Screenings, art, snacks, and freebies along with fun workshops at the Met just for teens!", gender: " 🌈 Gender: Mixed", numberofpeople: " 👥 Number of people: 25", location: "📍 1000 5th Ave, New York, NY 10028", text2: "Join and make friends with those who love art just as much as you do!",date: "🗓️ Date: August 14, 2024 |4pm - 8pm"),
            Event(title: "Intrepid Summer Movies!!", category: "STEM", description: "Come view movies of adventure at the home of adventure (Intrepid Air and Space Museum)! Kids and teens are welcome.", gender: " 🌈 Gender: Mixed", numberofpeople: " 👥 Number of people: 50 ~", location: "📍 Location: Pier 86, W 46th St, New York, NY 10036", text2: "Bring a comfy blanket and enjoying watching this Friday's movie, Moonfall.", date: "🗓️ Date: August 23 | 5pm - 9pm"),
        ]
    }
    func filter(by category: String?) {
        selectedCategory = category
    }
}


// Event Detail View
struct EventDetailView: View {
    @State private var response = ""
    @State private var isReported = false
    @State private var isLiked = false
    //@State private var isLiked = false
    var event: Event
    var body: some View {
        
        ZStack {
            // Lighter gradient background
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.8)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all) // Extend gradient to the edges of the screen
            
            
            ScrollView {
                VStack {
                    Spacer()
                        .frame(height: 15.0)
                    VStack(alignment: .leading, spacing: 20) {
                        // Event detail section
                        HStack {
                            Button {
                                self.isLiked.toggle()
                            } label: {
                                Image(systemName: isLiked ? "heart.fill" : "heart")
                                    .font(.system(size: 20))

                            }
                            
                        }
                        
                        
                        Text(event.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.bottom, 15)
                            .foregroundColor(.black) // Set text color to black
                        
                        Text("Category: \(event.category)")
                            .font(.headline)
                            .foregroundColor(.blue)
                        
                        Divider()
                        
                        Text(event.description)
                            .font(.body)
                            .foregroundColor(.black)
                        
                        // New text lines for number of people and gender
                        Text(event.gender)
                            .font(.subheadline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding([.leading, .top, .trailing], 15)
                            .foregroundColor(.blue.opacity(0.8))
                            .fixedSize(horizontal: false, vertical: true)
                        // Set text color to black
                        Text(event.numberofpeople)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding([.leading, .trailing], 15)
                            .foregroundColor(.blue.opacity(0.8))
                            .fixedSize(horizontal: false, vertical: true)
                        // Set text color to black
                        Text(event.location)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding([.leading, .trailing], 15)
                            .foregroundColor(.blue.opacity(0.8))
                            .fixedSize(horizontal: false, vertical: true)
                        Text(event.date)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding([.leading, .bottom, .trailing], 15)
                            .foregroundColor(.blue.opacity(0.8))
                            .fixedSize(horizontal: false, vertical: true)
                        
                        // Set text color to black
                        // Description text at the bottom
                        
                        Text(event.text2)
                            .font(.body)
                            .foregroundColor(.black) // Set text color to black
                            .padding(.all, 10)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        
                        Button("Sign Up!") {
                            response = "You're signed up! ✅"
                            
                        }
                        .padding()
                        .fontWeight(.bold)
                        .background()
                        .foregroundColor(.blue)
                        .cornerRadius(15.0)
                        .frame(maxWidth:  .infinity)
                        
                        
                        Text(response)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth:  .infinity)
                            
                        
                        Button(action: {
                            isReported.toggle()
                        }) {
                            Text(isReported ? "Event Reported!" : "Report this event")
                                .font(.body)
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(isReported ? Color.gray : Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }
                        .fontWeight(.bold)
                        .background()
                        .foregroundColor(.blue)
                        .cornerRadius(15.0)
                        if isReported {
                            Text("🚩")
                                .frame(maxWidth:  .infinity)
                            
                            
                        }
                    }
                }
                
                
            }
            
            .padding()
            .background(RoundedRectangle(cornerRadius: 15).fill(Color(UIColor.systemBackground)))
            .shadow(radius: 5) // Shadow applied to the box
            .padding()
            Spacer()
                .frame(height: 20.0)
        }
        
    }
    
}


// Main View
struct EventListView: View {
    @ObservedObject var viewModel = EventViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                // Lighter gradient background
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.8)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all) // Extend gradient to the edges of the screen
                
                VStack {
                    
                    // Custom Tab Bar for Filtering
                    HStack {
                        
                        Button(action: {
                            viewModel.filter(by: "Liberal Arts")
                        }) {
                            Text("Liberal Arts")
                                .padding()
                                .background(viewModel.selectedCategory == "Arts & Humanities" ? Color.blue.opacity(0.8) : Color.blue.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        Button(action: {
                            viewModel.filter(by: "Sports")
                        }) {
                            Text("Sports")
                                .padding()
                                .background(viewModel.selectedCategory == "Sports" ? Color.blue.opacity(0.8) : Color.blue.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        Button(action: {
                            viewModel.filter(by: "STEM")
                        }) {
                            Text("STEM")
                                .padding()
                                .background(viewModel.selectedCategory == "STEM" ? Color.blue.opacity(0.8) : Color.blue.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        Button(action: {
                            viewModel.filter(by: nil) // Show all events
                        }) {
                            Text("All")
                                .padding()
                                .background(viewModel.selectedCategory == nil ? Color.blue.opacity(0.8) : Color.blue.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    // Event List
                    
                    
                    List(viewModel.filteredEvents) {
                        event in
                        NavigationLink(destination: EventDetailView(event: event))
                        {
                            
                            VStack(alignment: .leading) {
                                
                                Text(event.title)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue)
                                    .multilineTextAlignment(.center)
                                    .padding([.top, .bottom, .trailing], 10.0)
                                Text(event.description)
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .padding([.top, .bottom, .trailing], 10.0)
                                
                            
                                    
                                }
                                
                            }
                            
                            
                        }
                        
                    }
                    
                    .navigationTitle("NearYou")
                    
                }
               
            }
            
        }
        
        
    }
    

    
    
    struct EventListView_Previews: PreviewProvider {
        static var previews: some View {
            EventListView()
        }
    }
    

    

