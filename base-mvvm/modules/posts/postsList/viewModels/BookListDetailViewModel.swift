import Foundation


class BookListDetailViewModel {
    var bookListModel: [BookListDetailModel] = []
    
    func getBookList() {
        bookListModel = [BookListDetailModel(imageName: "theOldMan",
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
                                                                        bookUpvoteCount: "20k"),
                                                    BookListDetailModel(imageName: "memory",
                                                                        bookTitle: "Moon65 is reading MEMORY",
                                                                        bookDescription: "As interesting as my math class",
                                                                        bookUpvoteCount: "5k"),]
    }
}
