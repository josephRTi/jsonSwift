import Foundation

// MARK: - ModelElement
struct ModelElement: Codable {
    let id: Int
    let firstName, lastName, email: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email, avatar
    }
}

typealias Model = [ModelElement]
