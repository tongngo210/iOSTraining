import UIKit

protocol SpiderDoneDelegate {
    func didTapDone(spider: Spider)
}

final class SpiderPickViewController: UIViewController {
    
    @IBOutlet private weak var spiderRatingView: SpiderRatingView!
    @IBOutlet private weak var tobeyButton: UIButton!
    @IBOutlet private weak var andrewButton: UIButton!
    @IBOutlet private weak var tomButton: UIButton!
    @IBOutlet private weak var doneButton: UIButton!
    
    var doneDelegate: SpiderDoneDelegate?
    
    private let spiders = [Spider(name: Name.Spider.tobey, poster: Image.Spider.tobeyLogo, icon: Image.Spider.tobeyIcon, rate: 0),
                           Spider(name: Name.Spider.andrew, poster: Image.Spider.andrewLogo, icon: Image.Spider.andrewIcon, rate: 0),
                           Spider(name: Name.Spider.tom, poster: Image.Spider.tomLogo, icon: Image.Spider.tomIcon, rate: 0)]
    
    var currentSpider: Spider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }

    @IBAction func didTapSpiderButton(_ sender: UIButton) {
        currentSpider = spiders[sender.tag]
        spiderRatingView.configView(spider: currentSpider)
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
