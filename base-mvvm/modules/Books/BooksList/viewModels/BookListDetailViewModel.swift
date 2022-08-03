import Foundation


class BookListDetailViewModel {
    var bookListModel: [BookListDetailModel] = []
    
    func getBookList(completion: @escaping() -> ()){
        FirebaseManager().getBookDetails { result in
            switch result {
            case .success(let bookList):
                if let bookList = bookList {
                    self.bookListModel = bookList
                    completion()
                }
            case .failure(let errrorMessage):
                print(errrorMessage)
                completion()
            }
        }
    }
    
}
