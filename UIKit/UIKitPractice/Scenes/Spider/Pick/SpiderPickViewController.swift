import UIKit

protocol SpiderDoneDelegate: AnyObject {
    func didTapDone(spider: Spider)
}

final class SpiderPickViewController: UIViewController {
    
    @IBOutlet private weak var spiderRatingView: SpiderRatingView!
    @IBOutlet private weak var tobeyButton: UIButton!
    @IBOutlet private weak var andrewButton: UIButton!
    @IBOutlet private weak var tomButton: UIButton!
    @IBOutlet private weak var doneButton: UIButton!
    
    weak var doneDelegate: SpiderDoneDelegate?
    
    private let spiders = Spider.spiders
    
    var currentSpider: Spider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }

    @IBAction func didTapSpiderButton(_ sender: UIButton) {
        if sender.tag < spiders.count {
            currentSpider = spiders[sender.tag]
            spiderRatingView.configView(spider: currentSpider)
        } else {
            print("Error button index")
        }
    }
    
    @IBAction func didTapDoneButton(_ sender: UIButton) {
        if let spider = spiderRatingView.spider {
            doneDelegate?.didTapDone(spider: spider)
        }
        dismiss(animated: true, completion: nil)
    }
}

extension SpiderPickViewController {
    private func configView() {
        configDoneButton()
        spiderRatingView.configView(spider: currentSpider)
    }
    
    private func configDoneButton() {
        doneButton.layer.cornerRadius = doneButton.frame.size.height / 2
    }
}
