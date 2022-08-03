import UIKit
import Kingfisher

class SearchViewCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCell(bookListDetailModel: BookListDetailModel) {
        if let imageName = bookListDetailModel.imageName,
           let url = URL(string: imageName){
            imageView.kf.setImage(with: url)
        }
    }
}
