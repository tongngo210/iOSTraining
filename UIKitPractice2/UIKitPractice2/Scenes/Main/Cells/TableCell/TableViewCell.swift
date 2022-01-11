import UIKit

final class TableViewCell: UITableViewCell {
    
    @IBOutlet private weak var itemCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemCollectionView.register(UINib(nibName: Name.Nib.itemCollectionCell, bundle: nil),
                                    forCellWithReuseIdentifier: Name.IdReuseCell.itemCollectionCell)
    }
    
    func setCollection(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate,
                       forRow row: Int) {
        itemCollectionView.delegate = dataSourceDelegate
        itemCollectionView.dataSource = dataSourceDelegate
        itemCollectionView.tag = row
        itemCollectionView.setContentOffset(itemCollectionView.contentOffset,
                                            animated: false)
        itemCollectionView.reloadData()
    }
    
    var collectionViewOffset: CGFloat {
        get { return itemCollectionView.contentOffset.x }
        set { itemCollectionView.contentOffset.x = newValue }
    }
}
