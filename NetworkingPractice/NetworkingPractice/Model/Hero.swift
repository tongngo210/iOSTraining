import Foundation

struct Hero: Decodable {
    let id: Int
    let name: String?
    let image: String?
    let roles: [String]?
    let primaryAttack: String?
    let baseHealth: Int?
    let baseMana: Int?
    
    private enum CodingKeys: String, CodingKey {
        case name = "localized_name"
        case image = "img"
        case id, roles
        case primaryAttack = "primary_attr"
        case baseHealth = "base_health"
        case baseMana = "base_mana"
    }
}
