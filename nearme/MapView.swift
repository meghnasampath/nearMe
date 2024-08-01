//import SwiftUI
//import MapKit
//
//struct MapView: View {
//    @StateObject private var viewModel = LocationsViewModel()
//
//    var body: some View {
//        ZStack {
//            // Gradient background
//            LinearGradient(
//                gradient: Gradient(colors: [.blue, .purple]),
//                startPoint: .top,
//                endPoint: .bottom
//            )
//            .opacity(0.8)
//            .edgesIgnoringSafeArea(.all)
//
//            VStack {
//                // Category buttons
//                HStack {
//                    ForEach(Category.allCases, id: \.self) { category in
//                        Button(action: {
//                            withAnimation {
//                                viewModel.toggleCategory(category)
//                            }
//                        }) {
//                            Text(category.rawValue)
//                                .padding()
//                                .background(viewModel.selectedCategories.contains(category) ? categoryColor(category) : Color.white)
//                                .foregroundColor(viewModel.selectedCategories.contains(category) ? .white : .black) // Black text for non-selected
//                                .cornerRadius(8)
//                                .shadow(radius: 5)
//                        }
//                        .padding(5)
//                    }
//                }
//                .padding()
//
//                Map(
//                    coordinateRegion: $viewModel.mapRegion,
//
//                    annotationItems: viewModel.filteredLocations
//                    ) { location in
//                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
//
//
//                        VStack {
//                            Circle()
//                                .fill(categoryColor(location.category))
//                                .frame(width: 20, height: 20)
//                                .shadow(radius: 5)
//                            Text(location.name)
//                                .font(.caption)
//                                .bold()
//                                .foregroundColor(.white)
//                                .padding(2)
//                                .background(Color.black.opacity(0.7))
//                                .cornerRadius(5)
//                        }
//                        .scaleEffect(viewModel.selectedLocation?.id == location.id ? 1.2 : 1.0)
//                        .onTapGesture {
//                            withAnimation(.easeInOut) {
//                                viewModel.selectedLocation = location
//                            }
//                        }
//                    }
//                }
//                .frame(height: 400)
//                .cornerRadius(10)
//                .shadow(radius: 10)
//
//                // Zoom buttons
//                HStack {
//                    Button(action: zoomIn) {
//                        Image(systemName: "plus") // Use SF Symbols or ensure your image is added to assets
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 30, height: 30)
//                            .padding()
//                            .background(Color.white)
//                            .foregroundColor(.blue)
//                            .clipShape(Circle())
//                            .shadow(radius: 5)
//                    }
//                    .padding(5)
//
//                    Button(action: zoomOut) {
//                        Image(systemName: "minus") // Use SF Symbols or ensure your image is added to assets
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 30, height: 30)
//                            .padding()
//                            .background(Color.white)
//                            .foregroundColor(.blue)
//                            .clipShape(Circle())
//                            .shadow(radius: 5)
//                    }
//                    .padding(5)
//                }
//
//                // Location details
//                if let selectedLocation = viewModel.selectedLocation {
//                    VStack {
//                        Text(selectedLocation.name)
//                            .font(.headline)
//                            .padding(.bottom, 2)
//                        Text(selectedLocation.address)
//                        Text("Rating: \(selectedLocation.rating)")
//                        Text("Phone: \(selectedLocation.phoneNumber)")
//                    }
//                    .padding()
//                    .background(Color.white)
//                    .cornerRadius(10)
//                    .shadow(radius: 5)
//                    .padding(.top, 10)
//                } else {
//                    Text("Click on a location to see more details!")
//                        .padding()
//                        .background(Color.white)
//                        .cornerRadius(10)
//                        .shadow(radius: 5)
//                        .padding(.top, 10)
//                }
//            }
//            .padding()
//        }
//    }
//
//    private func categoryColor(_ category: Category) -> Color {
//        switch category {
//        case .stem: return .green
//        case .art: return .blue
//        case .sports: return .red
//        }
//    }
//
//    private func zoomIn() {
//        var region = viewModel.mapRegion
//        region.span.latitudeDelta /= 2
//        region.span.longitudeDelta /= 2
//        viewModel.mapRegion = region
//    }
//
//    private func zoomOut() {
//        var region = viewModel.mapRegion
//        region.span.latitudeDelta *= 2
//        region.span.longitudeDelta *= 2
//
//
//    }
//
//}
