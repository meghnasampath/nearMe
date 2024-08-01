import Foundation

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let category: Category
    let latitude: Double
    let longitude: Double
    let address: String
    let rating: Double
    let phoneNumber: String
}

enum Category: String, CaseIterable {
    case stem = "STEM"
    case art = "ART"
    case sports = "SPORTS"
}
