import UIKit

final class EasyCustomView: UIView {
    @IBOutlet private weak var customView: UIView!
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        Bundle.main.loadNibNamed(Name.NibName.easyCustomView,
                                 owner: self, options: nil)
        self.addSubview(customView)
        customView.frame = self.bounds
    }
    
    func configView(spider: Spider?) {
        backgroundView.backgroundColor = .random
        imageView.image = spider?.poster ?? UIImage()
        nameLabel.text = "This is \(spider?.name ?? "")"
    }
}
