import UIKit

final class HeroCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var heroImageView: UIImageView!
    @IBOutlet private weak var heroNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        heroImageView.layer.cornerRadius = 15
    }
    
    func configCell(hero: Hero?) {
        if let hero = hero {
            heroImageView.getImageFromURL(APIURLs.baseURL + (hero.image ?? ""))
            heroNameLabel.text = hero.name
        }
    }
}
