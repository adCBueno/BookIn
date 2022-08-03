import UIKit

class BookListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var bookListTableView: UITableView!
    var bookListDetailViewModel: BookListDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        bookListTableView.backgroundColor = ColorConstants.backgroundColorLight
        bookListDetailViewModel = BookListDetailViewModel()
        bookListDetailViewModel?.getBookList(completion: {
            self.bookListTableView.reloadData()
        })
        bookListTableView.register(UINib.init(nibName: "BookListTableViewCell", bundle: nil),
                                   forCellReuseIdentifier: "BookListTableViewCell")
    }
    
    func setupNavigationBar() {
        navigationItem.title = "BookIn"
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
        tableViewCell.updateCellModel(bookListDetailModel: bookListDetailViewModel.bookListModel[indexPath.row])
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let bookListModel = bookListDetailViewModel?.bookListModel[indexPath.row],
              let bookDetailViewController = BookDetailViewController(bookListDetailModel: bookListModel) else { return }
        self.navigationController?.pushViewController(bookDetailViewController, animated: true)
    }
    
}
