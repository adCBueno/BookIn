import UIKit

class BookListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var bookImageVIew: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookDescription: UILabel!
    @IBOutlet weak var upvoteCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCellModel(bookListDetailModel: BookListDetailModel) {
        bookImageVIew.image = UIImage(named: bookListDetailModel.imageName ?? "")
        bookTitle.text = bookListDetailModel.bookTitle
        bookDescription.text = bookListDetailModel.bookDescription
        upvoteCount.text = bookListDetailModel.bookUpvoteCount
    }
}
