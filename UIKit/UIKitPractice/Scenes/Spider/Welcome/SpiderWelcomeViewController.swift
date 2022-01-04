import UIKit

final class SpiderWelcomeViewController: UIViewController {
    @IBOutlet private weak var spiderNameLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var chooseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    @IBAction func chooseButtonPressed(_ sender: UIButton) {
        let spiderPickStoryboard = Storyboard.spiderPick.id
        guard let spiderPickVC = spiderPickStoryboard.instantiateViewController(withIdentifier: ViewController.spiderPick.id) as? SpiderPickViewController
        else { return }
        spiderPickVC.selectionDelegate = self
        navigationController?.present(spiderPickVC, animated: true, completion: nil)
    }
}

extension SpiderWelcomeViewController: SpiderSelectionDelegate {
    func didTapChoice(image: UIImage, name: String) {
        imageView.image = image
        spiderNameLabel.text = name
    }
}

extension SpiderWelcomeViewController {
    private func configView() {
        configButton()
    }
    private func configButton() {
        chooseButton.layer.cornerRadius = chooseButton.frame.size.height / 2
    }
}
