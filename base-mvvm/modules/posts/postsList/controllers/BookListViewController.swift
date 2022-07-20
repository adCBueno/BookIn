import UIKit

class BookListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var bookListTableVIew: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
       
        bookListTableVIew.register(UINib.init(nibName: "BookListTableViewCell", bundle: nil),
                                  forCellReuseIdentifier: "BookListTableViewCell")
    }
    
    func setupNavigationBar() {
        title = "Book In"
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = ColorConstants.headerColor
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .red
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "BookListTableViewCell", for: indexPath)
        return tableViewCell
    }
    
}
