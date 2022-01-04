import UIKit

protocol SpiderSelectionDelegate {
    func didTapChoice(image: UIImage, name: String)
}

final class SpiderPickViewController: UIViewController {
    @IBOutlet private weak var tobeyButton: UIButton!
    @IBOutlet private weak var andrewButton: UIButton!
    @IBOutlet private weak var tomButton: UIButton!
    
    var selectionDelegate: SpiderSelectionDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        tobeyButton.imageView?.contentMode = .scaleAspectFit
        tobeyButton.imageView?.layer.cornerRadius = 10
    }

    @IBAction func spiderButtonPressed(_ sender: UIButton) {
        let spider = Spider.allCases[sender.tag]
        selectionDelegate.didTapChoice(image: spider.logo, name: spider.name)
        dismiss(animated: true, completion: nil)
    }
}

extension SpiderPickViewController {
    private func configView() {
        
    }
}
