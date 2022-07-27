import UIKit

class BookDetailViewController: UIViewController {

    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookTitleDescription: UILabel!
    @IBOutlet weak var upvoteLabel: UILabel!
    @IBOutlet weak var bookImageView: UIImageView!
    
    
    @IBOutlet weak var bookDescriptionText: UITextView!
    @IBOutlet weak var descriptionLabel: UILabel!
    var bookListDetailModel: BookListDetailModel
    
    required init?(bookListDetailModel: BookListDetailModel) {
        self.bookListDetailModel = bookListDetailModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookTitle.text = bookListDetailModel.bookTitle
        bookDescriptionText.text  = bookListDetailModel.bookDescription
        bookImageView.image = UIImage(named: bookListDetailModel.imageName ?? "")
        if let bookUpvoteCount = bookListDetailModel.bookUpvoteCount {
            upvoteLabel.text = "\(bookUpvoteCount) voted for this story"
        }
        
    }

    @IBAction func upvoteButtonAction(_ sender: Any) {
    }
    
    @IBAction func downvoteButtonAction(_ sender: Any) {
    }
    @IBAction func commentButtonAction(_ sender: Any) {
        let addCommentViewController = AddCommentViewController(nibName: "AddCommentViewController", bundle: nil)
        self.navigationController?.pushViewController(addCommentViewController, animated: true)
    }
    
}
