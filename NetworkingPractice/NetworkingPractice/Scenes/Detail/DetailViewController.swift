import UIKit

final class DetailViewController: UIViewController {

    @IBOutlet private weak var heroImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var primaryAttackLabel: UILabel!
    @IBOutlet private weak var healthLabel: UILabel!
    @IBOutlet private weak var manaLabel: UILabel!
    
    var heroStats: Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        updateUI(hero: heroStats)
    }
}
//MARK: - Configure UI
extension DetailViewController {
    private func configView() {
        title = Name.detailTitle
    }
    
    private func updateUI(hero: Hero?) {
        if let hero = hero {
            heroImageView.getImageFromURL(APIURLs.baseURL + (hero.image ?? ""))
            nameLabel.text = hero.name
            primaryAttackLabel.text = hero.primaryAttack?.firstUppercased
            healthLabel.text = "\(hero.baseHealth ?? 0)"
            manaLabel.text = "\(hero.baseMana ?? 0)"
        }
    }
}
