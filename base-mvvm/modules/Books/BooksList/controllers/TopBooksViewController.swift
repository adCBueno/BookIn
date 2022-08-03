import UIKit

class TopBooksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var topBooksTableView: UITableView!
    var bookListDetailViewModel: BookListDetailViewModel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        topBooksTableView.backgroundColor = ColorConstants.backgroundColorLight
        bookListDetailViewModel = BookListDetailViewModel()
        bookListDetailViewModel?.getBookList(completion: {
            self.topBooksTableView.reloadData()
        })
        topBooksTableView.register(UINib.init(nibName: "BookListTableViewCell", bundle: nil),
                                   forCellReuseIdentifier: "BookListTableViewCell")
    }
    func setupNavigationBar() {
        navigationItem.title = "Top Books in BookIn"
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = ColorConstants.headerColor
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .red
        // addLogoutButton()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bookListDetailViewModel?.bookListModel.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "BookListTableViewCell", for: indexPath) as? BookListTableViewCell,
        let bookListDetailViewModel = bookListDetailViewModel else {
            return  UITableViewCell()
        }
        tableViewCell.updateCellModel(bookListDetailModel: bookListDetailViewModel.bookListModel[indexPath.row], ranking: "#\(indexPath.row + 1)", isTopBookScreen: true)
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let bookListModel = bookListDetailViewModel?.bookListModel[indexPath.row],
              let bookDetailViewController = BookDetailViewController(bookListDetailModel: bookListModel) else { return }
        self.navigationController?.pushViewController(bookDetailViewController, animated: true)
    }
    
}
