import UIKit

protocol CartTableCellDelegate: AnyObject {
    func didChangeValueChooseSwitch(index: Int, isChoosen: Bool)
}

final class CartTableCell: UITableViewCell {

    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemNameLabel: UILabel!
    @IBOutlet private weak var itemPriceLabel: UILabel!
    @IBOutlet private weak var chooseSwitch: UISwitch!
    
    weak var cartTableCellDelegate: CartTableCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func didChangeValueSwitch(_ sender: UISwitch) {
        cartTableCellDelegate?.didChangeValueChooseSwitch(index: sender.tag,
                                                          isChoosen: sender.isOn)
    }
    
    func configView(item: Item?, indexPath: IndexPath) {
        itemImageView.getImageFromURL(item?.imageUrl ?? "")
        itemNameLabel.text = item?.name
        itemPriceLabel.text = "\(item?.price ?? 0) $"
        chooseSwitch.isOn = item?.isChoosen ?? false
        chooseSwitch.tag = indexPath.row
    }
}
