import Foundation

struct SearchBooksViewModel {
    var sectionName = ["Romance", "Fiction", "Fantasy"]
    var bookDetailsDict: [String: [BookListDetailModel]] = [:]
    
    init() {
        setupDataModel()
    }
    
    mutating func setupDataModel() {
        bookDetailsDict["Romance"] = [BookListDetailModel(imageName: "theOldMan",
                                                          bookTitle: "THE OLD MAN",
                                                          bookDescription: "A man that changes his city for ever, just one word",
                                                          bookUpvoteCount: "55k"),
                                      BookListDetailModel(imageName: "qualityDesign",
                                                          bookTitle: "QUALITY DESIGN",
                                                          bookDescription: "Design patterns, raw and evolution in design. Last 100 years in one book",
                                                          bookUpvoteCount: "12k"),
                                      BookListDetailModel(imageName: "memory",
                                                          bookTitle: "MEMORY",
                                                          bookDescription: "A novel about pain, fear and a lot of lies",
                                                          bookUpvoteCount: "11k"),
                                      BookListDetailModel(imageName: "thenMindofLeader",
                                                          bookTitle: "THE MIND OF A LEADER",
                                                          bookDescription: "The secret to be successful",
                                                          bookUpvoteCount: "20k")]
        
        
        bookDetailsDict["Fiction"] = [BookListDetailModel(imageName: "qualityDesign",
                                                          bookTitle: "QUALITY DESIGN",
                                                          bookDescription: "Design patterns, raw and evolution in design. Last 100 years in one book",
                                                          bookUpvoteCount: "12k"),
                                      BookListDetailModel(imageName: "memory",
                                                          bookTitle: "MEMORY",
                                                          bookDescription: "A novel about pain, fear and a lot of lies",
                                                          bookUpvoteCount: "11k"),
                                      BookListDetailModel(imageName: "thenMindofLeader",
                                                          bookTitle: "THE MIND OF A LEADER",
                                                          bookDescription: "The secret to be successful",
                                                          bookUpvoteCount: "20k"),
                                      BookListDetailModel(imageName: "theOldMan",
                                                          bookTitle: "THE OLD MAN",
                                                          bookDescription: "A man that changes his city for ever, just one word",
                                                          bookUpvoteCount: "55k")]
        
        bookDetailsDict["Fantasy"] = [ BookListDetailModel(imageName: "thenMindofLeader",
                                                           bookTitle: "THE MIND OF A LEADER",
                                                           bookDescription: "The secret to be successful",
                                                           bookUpvoteCount: "20k"),
                                       BookListDetailModel(imageName: "theOldMan",
                                                           bookTitle: "THE OLD MAN",
                                                           bookDescription: "A man that changes his city for ever, just one word",
                                                           bookUpvoteCount: "55k"),
                                       BookListDetailModel(imageName: "memory",
                                                           bookTitle: "Moon65 is reading MEMORY",
                                                           bookDescription: "As interesting as my math class",
                                                           bookUpvoteCount: "5k"),
                                       BookListDetailModel(imageName: "memory",
                                                           bookTitle: "MEMORY",
                                                           bookDescription: "A novel about pain, fear and a lot of lies",
                                                           bookUpvoteCount: "11k")]
        
    }
    
    func getBookList(for section: String) -> [BookListDetailModel]? {
        let bookList = bookDetailsDict[section]
        return bookList
    }
}
