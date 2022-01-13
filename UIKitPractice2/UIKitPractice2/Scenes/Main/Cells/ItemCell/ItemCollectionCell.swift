import UIKit

final class ItemCollectionCell: UICollectionViewCell {
    
    @IBOutlet private weak var view: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.setCornerRadius(view.frame.size.height / 10)
    }
    
    func configView(item: Item?) {
        imageView.getImageFromURL(item?.imageUrl ?? "")
        priceLabel.text = "\(item?.price ?? 0) $"
        nameLabel.text = item?.name ?? ""
    }
}
