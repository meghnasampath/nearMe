//import MapKit
//
//class LocationsViewModel: ObservableObject {
//    @Published var locations: [Location] = [
//        // STEM
//        Location(name: "New York Hall of Science", category: .stem, latitude: 40.7471, longitude: -73.8526, address: "47-01 111th St, Queens, NY 11368", rating: 4.5, phoneNumber: "(718) 699-0005"),
//        Location(name: "American Museum of Natural History", category: .stem, latitude: 40.7813, longitude: -73.9735, address: "Central Park West & 79th St, New York, NY 10024", rating: 4.7, phoneNumber: "(212) 769-5100"),
//        Location(name: "Intrepid Sea, Air & Space Museum", category: .stem, latitude: 40.7645, longitude: -73.9996, address: "Pier 86, W 46th St, New York, NY 10036", rating: 4.6, phoneNumber: "(212) 245-0072"),
//        Location(name: "Cooper Hewitt, Smithsonian Design Museum", category: .stem, latitude: 40.7840, longitude: -73.9588, address: "2 E 91st St, New York, NY 10128", rating: 4.4, phoneNumber: "(212) 849-8400"),
//        Location(name: "New York Academy of Sciences", category: .stem, latitude: 40.7084, longitude: -74.0139, address: "7 World Trade Center, 250 Greenwich St, New York, NY 10007", rating: 4.6, phoneNumber: "(212) 298-8600"),
//        Location(name: "Brooklyn Botanic Garden", category: .stem, latitude: 40.6694, longitude: -73.9624, address: "990 Washington Ave, Brooklyn, NY 11225", rating: 4.7, phoneNumber: "(718) 623-7200"),
//        Location(name: "Liberty Science Center", category: .stem, latitude: 40.7081, longitude: -74.0555, address: "222 Jersey City Blvd, Jersey City, NJ 07305", rating: 4.5, phoneNumber: "(201) 200-1000"),
//        Location(name: "SciTech Kids", category: .stem, latitude: 40.7736, longitude: -73.9590, address: "215 E 81st St, New York, NY 10028", rating: 4.8, phoneNumber: "(212) 804-7055"),
//        Location(name: "Beam Center", category: .stem, latitude: 40.6868, longitude: -73.9875, address: "60 Sackett St, Brooklyn, NY 11231", rating: 4.6, phoneNumber: "(347) 855-7600"),
//        
//        // ART
//        Location(name: "The Museum of Modern Art (MoMA)", category: .art, latitude: 40.7614, longitude: -73.9776, address: "11 W 53rd St, New York, NY 10019", rating: 4.7, phoneNumber: "(212) 708-9400"),
//        Location(name: "The Metropolitan Museum of Art", category: .art, latitude: 40.7794, longitude: -73.9632, address: "1000 5th Ave, New York, NY 10028", rating: 4.8, phoneNumber: "(212) 535-7710"),
//        Location(name: "Brooklyn Museum", category: .art, latitude: 40.6712, longitude: -73.9580, address: "200 Eastern Pkwy, Brooklyn, NY 11238", rating: 4.6, phoneNumber: "(718) 638-5000"),
//        Location(name: "The Whitney Museum of American Art", category: .art, latitude: 40.7382, longitude: -74.0076, address: "99 Gansevoort St, New York, NY 10014", rating: 4.6, phoneNumber: "(212) 570-3600"),
//        Location(name: "The Museum of Arts and Design (MAD)", category: .art, latitude: 40.7688, longitude: -73.9811, address: "2 Columbus Cir, New York, NY 10019", rating: 4.5, phoneNumber: "(212) 299-7777"),
//        Location(name: "Solomon R. Guggenheim Museum", category: .art, latitude: 40.7829, longitude: -73.9580, address: "1071 5th Ave, New York, NY 10128", rating: 4.5, phoneNumber: "(212) 423-3500"),
//        Location(name: "The Frick Collection", category: .art, latitude: 40.7712, longitude: -73.9671, address: "1 E 70th St, New York, NY 10021", rating: 4.7, phoneNumber: "(212) 288-0700"),
//        Location(name: "Museum of the City of New York", category: .art, latitude: 40.7910, longitude: -73.9580, address: "1220 5th Ave, New York, NY 10029", rating: 4.5, phoneNumber: "(212) 534-1672"),
//        Location(name: "Neue Galerie New York", category: .art, latitude: 40.7794, longitude: -73.9630, address: "1048 5th Ave, New York, NY 10028", rating: 4.6, phoneNumber: "(212) 628-6200"),
//        Location(name: "The Cloisters", category: .art, latitude: 40.8602, longitude: -73.9361, address: "99 Margaret Corbin Dr, New York, NY 10040", rating: 4.8, phoneNumber: "(212) 923-3700"),
//        
//        // SPORTS
//        Location(name: "Chelsea Piers Sports & Entertainment Complex", category: .sports, latitude: 40.7465, longitude: -74.0094, address: "62 Chelsea Piers, New York, NY 10011", rating: 4.6, phoneNumber: "(212) 336-6666"),
//        Location(name: "Asphalt Green", category: .sports, latitude: 40.7802, longitude: -73.9445, address: "555 E 90th St, New York, NY 10128", rating: 4.5, phoneNumber: "(212) 369-8890"),
//        Location(name: "Central Park Sports", category: .sports, latitude: 40.7851, longitude: -73.9683, address: "Central Park, New York, NY", rating: 4.7, phoneNumber: "N/A (Central Park Conservancy: (212) 310-6600)"),
//        Location(name: "Brooklyn Bridge Park", category: .sports, latitude: 40.7003, longitude: -73.9965, address: "334 Furman St, Brooklyn, NY 11201", rating: 4.8, phoneNumber: "(718) 222-9939"),
//        Location(name: "Flushing Meadows Corona Park", category: .sports, latitude: 40.7498, longitude: -73.8409, address: "Queens, NY 11368", rating: 4.5, phoneNumber: "(718) 760-6565"),
//        Location(name: "Hudson River Park", category: .sports, latitude: 40.7355, longitude: -74.0101, address: "New York, NY", rating: 4.6, phoneNumber: "(212) 627-2020"),
//        Location(name: "Riverside Park", category: .sports, latitude: 40.8036, longitude: -73.9704, address: "New York, NY", rating: 4.7, phoneNumber: "(212) 870-3070"),
//        Location(name: "Governors Island", category: .sports, latitude: 40.7150, longitude: -74.0165, address: "New York, NY", rating: 4.7, phoneNumber: "(212) 440-2200"),
//        Location(name: "Prospect Park", category: .sports, latitude: 40.6613, longitude: -73.9680, address: "Brooklyn, NY", rating: 4.8, phoneNumber: "(718) 965-8951"),
//        Location(name: "The High Line", category: .sports, latitude: 40.7477, longitude: -74.0044, address: "New York, NY", rating: 4.8, phoneNumber: "(212) 500-6035"),
//    ]
//    
//    @Published var selectedCategories: Set<Category> = []
//    @Published var selectedLocation: Location? = nil
//    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
//    
//    func toggleCategory(_ category: Category) {
//        if selectedCategories.contains(category) {
//            selectedCategories.remove(category)
//        } else {
//            selectedCategories.insert(category)
//        }
//    }
//    
//    var filteredLocations: [Location] {
//        locations.filter { selectedCategories.contains($0.category) }
//    }
//}
