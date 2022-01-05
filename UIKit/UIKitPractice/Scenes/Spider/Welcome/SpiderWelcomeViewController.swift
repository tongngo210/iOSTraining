import UIKit

final class SpiderWelcomeViewController: UIViewController {
    @IBOutlet private weak var spiderNameLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var chooseButton: UIButton!
    @IBOutlet private weak var rateLabel: UILabel!
    @IBOutlet private weak var emojiTitleLabel: UILabel!
    
    var currentSpider: Spider? {
        didSet {
            updateUI(spider: currentSpider)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    @IBAction func chooseButtonPressed(_ sender: UIButton) {
        let spiderPickStoryboard = Storyboard.spiderPick.id
        guard let spiderPickVC = spiderPickStoryboard.instantiateViewController(withIdentifier: ViewController.spiderPick.id) as? SpiderPickViewController
        else { return }
        spiderPickVC.doneDelegate = self
        
        spiderPickVC.currentSpider = currentSpider
        
        navigationController?.present(spiderPickVC, animated: true, completion: nil)
    }
}

extension SpiderWelcomeViewController: SpiderDoneDelegate {
    func didTapDone(spider: Spider) {
        self.currentSpider = spider
    }
}

extension SpiderWelcomeViewController {
    private func configView() {
        configButton()
    }
    
    private func configButton() {
        chooseButton.layer.cornerRadius = chooseButton.frame.size.height / 2
    }
    
    private func updateUI(spider: Spider?) {
        imageView.image = spider?.poster
        spiderNameLabel.text = spider?.name
        rateLabel.text = "\(spider?.rate ?? 0) %"
        emojiTitleLabel.text = RatingCases(rateValue: spider?.rate ?? 0)?.rawValue
        [emojiTitleLabel,rateLabel].forEach { $0.textColor = .white }
    }
}
