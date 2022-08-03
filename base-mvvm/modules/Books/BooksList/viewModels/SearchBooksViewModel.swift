import Foundation

class SearchBooksViewModel: NSCopying {
    var sectionName: [String] = []
    var bookDetailsDict: [String: [BookListDetailModel]] = [:]
    var bookListModel: [BookListDetailModel] = []

    
     func getBookList(completion: @escaping() -> () ) {
        FirebaseManager().getBookDetails { result in
            switch result {
            case .success(let bookList):
                if let bookList = bookList {
                    self.bookListModel = bookList
                    self.setupDataModel()
                    completion()
                }
            case .failure(let errrorMessage):
                print(errrorMessage)
                completion()
            }
        }
    }
    
     func setupDataModel() {
        for bookListModel in bookListModel {
            if let category = bookListModel.category {
                if bookDetailsDict.keys.contains(category) {
                    bookDetailsDict[category]?.append(bookListModel)
                } else {
                    bookDetailsDict[category] =  [bookListModel]
                    sectionName.append(category)
                }
            }
        }
    }
    
    func getBookList(for section: String) -> [BookListDetailModel]? {
        let bookList = bookDetailsDict[section]
        return bookList
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = SearchBooksViewModel()
        copy.bookListModel = bookListModel
        copy.bookDetailsDict = bookDetailsDict
        copy.sectionName = sectionName
          return copy
      }
}
