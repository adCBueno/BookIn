import UIKit

class SearchBooksViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBookCollectionView: UICollectionView!
    var searchBooksViewModel: SearchBooksViewModel = SearchBooksViewModel()
    var filteredModel: SearchBooksViewModel = SearchBooksViewModel()
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        searchBooksViewModel.getBookList {
            self.filteredModel = self.searchBooksViewModel.copy() as! SearchBooksViewModel
            self.searchBookCollectionView.reloadData()
        }
        searchBookCollectionView.register(UINib.init(nibName: "SearchViewCollectionViewCell", bundle: nil),
                                          forCellWithReuseIdentifier: "SearchViewCollectionViewCell")
        
        searchBookCollectionView.register(UINib(nibName:"SearchViewHeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind:  UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchViewHeaderCollectionReusableView")
    }
    
    func setupNavigationBar() {
        navigationItem.title = "New Books"
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = ColorConstants.headerColor
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .red
        // addLogoutButton()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        filteredModel.sectionName.count
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredModel = searchBooksViewModel.copy() as! SearchBooksViewModel
        if searchText.isEmpty {
            filteredModel = searchBooksViewModel.copy() as! SearchBooksViewModel
        } else {
            for sectionName in filteredModel.sectionName {
                if let rows = filteredModel.getBookList(for: sectionName) {
                    filteredModel.bookDetailsDict[sectionName] = rows.filter ({
                        $0.bookTitle.lowercased().contains(searchText.lowercased()) ||
                        $0.author?.lowercased().prefix(searchText.count) ?? "" == searchText.lowercased() })
                }
            }
        }
        searchBookCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionName = filteredModel.sectionName
        if let rows = filteredModel.getBookList(for: sectionName[section]) {
            return rows.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let searchViewCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchViewCollectionViewCell", for: indexPath as IndexPath) as? SearchViewCollectionViewCell else { return UICollectionViewCell() }
        
        let sectionName = filteredModel.sectionName
        if let rows = filteredModel.getBookList(for: sectionName[indexPath.section]) {
            searchViewCollectionViewCell.configCell(bookListDetailModel: rows[indexPath.row])
        }
        
        return searchViewCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SearchViewHeaderCollectionReusableView", for: indexPath) as? SearchViewHeaderCollectionReusableView {
                sectionHeader.header.text = filteredModel.sectionName[indexPath.section]
                return sectionHeader
            }
        default:
            return UICollectionReusableView()
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionName = filteredModel.sectionName[indexPath.section]
        guard  let bookListModels = filteredModel.getBookList(for: sectionName),
               let bookDetailViewController = BookDetailViewController(bookListDetailModel: bookListModels[indexPath.row]) else { return }
        self.navigationController?.pushViewController(bookDetailViewController, animated: true)
    }
}

extension SearchBooksViewController {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            view.endEditing(true)
    }
}
