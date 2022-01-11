import UIKit

protocol CustomCartButtonDelegate {
    func didTapCartButton()
}

final class CustomCartButton: UIView {
    
    @IBOutlet private weak var cartButton: UIButton!
    @IBOutlet private weak var numberLabel: UILabel!
    
    var customCartButtonDelegate: CustomCartButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        guard let view = Bundle.main.loadNibNamed(Name.Nib.customCartButton,
                                                  owner: self, options: nil)?.first as? UIView
        else { return }
        self.addSubview(view)
        view.frame = self.bounds
        
        numberLabel.layer.masksToBounds = true
        numberLabel.layer.cornerRadius = numberLabel.layer.bounds.height / 2
    }
    
    @IBAction func didTapCartButton(_ sender: UIButton) {
        customCartButtonDelegate?.didTapCartButton()
    }
    
    func updateNumberOfItems(_ numberOfItems: Int) {
        numberLabel.text = "\(numberOfItems)"
    }
}
