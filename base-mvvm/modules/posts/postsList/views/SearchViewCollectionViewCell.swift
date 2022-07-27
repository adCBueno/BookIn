import UIKit

class SearchViewCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCell(bookListDetailModel: BookListDetailModel) {
        if let imageName = bookListDetailModel.imageName {
            imageView.image = UIImage(named: imageName)
        }
    }
}
