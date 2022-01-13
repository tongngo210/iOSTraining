import UIKit

final class CustomViewController: UIViewController {
    @IBOutlet weak var customView: EasyCustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let spider = Spider.spiders.randomElement()
        customView.configView(spider: spider)
    }
}
