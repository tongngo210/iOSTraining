import UIKit

final class SpiderRatingView: UIView {
    @IBOutlet private weak var spiderImageView: UIImageView!
    @IBOutlet private weak var spiderNameLabel: UILabel!
    @IBOutlet private weak var spiderRatingLabel: UILabel!
    @IBOutlet private weak var ratingSlider: UISlider!
    
    var spider: Spider?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadViewFromNib()
    }
    
    private func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        guard let view = bundle.loadNibNamed(Name.NibName.spiderRatingView,
                                             owner: self, options: nil)?.first as? UIView
        else {return}
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    @IBAction func didChangeValueSlider(_ sender: UISlider) {
        let value = Int(sender.value)
        spiderRatingLabel.text = "\(value) %"
        spider?.rate = value
    }
    
    func configView(spider: Spider?) {
        self.spider = spider
        spiderNameLabel.text = spider?.name
        spiderRatingLabel.text = "\(spider?.rate ?? 0) %"
        spiderImageView.image = spider?.icon
        ratingSlider.value = Float(spider?.rate ?? 0)
    }
}
