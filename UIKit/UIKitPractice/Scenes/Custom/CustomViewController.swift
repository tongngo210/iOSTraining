import UIKit

final class CustomViewController: UIViewController {
    @IBOutlet weak var customView: EasyCustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.configView(image: Spider.tobey.logo,
                              spiderName: Spider.tobey.name)
    }
}
