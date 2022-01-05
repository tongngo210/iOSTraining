import UIKit

final class CustomViewController: UIViewController {
    @IBOutlet weak var customView: EasyCustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let spider = Spider(name: Name.Spider.tobey, poster: Image.Spider.tobeyLogo, icon: Image.Spider.tobeyIcon, rate: 0)
        customView.configView(image: spider.poster,
                              spiderName: spider.name)
    }
}
