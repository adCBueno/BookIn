import Foundation

struct BookListDetailModel {
    let id: String = UUID().uuidString
    var imageName: String?
    var bookTitle: String
    var bookDescription: String?
    var bookUpvoteCount: String?
}
