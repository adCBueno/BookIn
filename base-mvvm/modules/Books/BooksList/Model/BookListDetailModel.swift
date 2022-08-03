import Foundation
import CodableFirebase
import Firebase

extension Timestamp: TimestampType {}

struct BookListDetailModel {
    let id: String = UUID().uuidString
    let author: String?
    var imageName: String?
    var bookTitle: String
    var bookDescription: String?
    var bookUpvoteCount: String?
    let category: String?
    let createdAt: Timestamp?
    let updatedAt: Timestamp?
    let comment: [String]?
    let idOwner: [String]?
}

struct BookListResponse: Codable {
    let author: String?
    let category: String?
    let createdAt: Timestamp?
    let image: String?
    let sinopsis: String?
    let title: String?
    let updatedAt: Timestamp?
    let comment: [String]?
    let idOwner: [String]?
}
