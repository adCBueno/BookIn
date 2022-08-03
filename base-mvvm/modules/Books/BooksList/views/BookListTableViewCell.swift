import UIKit
import Kingfisher

class BookListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookDescription: UILabel!
    @IBOutlet weak var upvoteCount: UILabel!
    
    @IBOutlet weak var rankingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateCellModel(bookListDetailModel: BookListDetailModel, ranking: String? = nil, isTopBookScreen: Bool = false) {
        if let imageName = bookListDetailModel.imageName,
           let url = URL(string: imageName) {
            bookImageView.kf.setImage(with: url)
        }
    
        var bookTitleText = ""
        if let ranking = ranking {
            rankingLabel.text = ranking
        } else {
            rankingLabel.text = ""
        }
        
        if let user = bookListDetailModel.idOwner {
            for user in user {
                if bookTitleText.isEmpty {
                    bookTitleText = user
                } else {
                    bookTitleText = bookTitleText + "," + user
                }
            }
            bookTitleText = bookTitleText + " is reading " + bookListDetailModel.bookTitle
        } else {
            bookTitleText = bookListDetailModel.bookTitle
        }
        bookTitle.text = bookTitleText
        bookDescription.text = isTopBookScreen ? bookListDetailModel.bookDescription : bookListDetailModel.comment?.first
        upvoteCount.text = bookListDetailModel.bookUpvoteCount
    }
}
