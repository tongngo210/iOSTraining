import UIKit

protocol DetailDelegate: AnyObject {
    func didTapDone(editedItem: Item?)
    func didTapAddToCart(item: Item?)
}

final class DetailViewController: UIViewController {

    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemNameTextField: UITextField!
    @IBOutlet private weak var itemPriceTextField: UITextField!
    @IBOutlet private weak var addToCartButton: UIButton!
    @IBOutlet private weak var doneButton: UIButton!
    
    var item: Item?
    weak var detailDelegate: DetailDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    @IBAction func didTapDoneButton(_ sender: UIButton) {
        let newItemInfo = Item(name: itemNameTextField.text,
                               imageUrl: item?.imageUrl,
                               price: Double(itemPriceTextField.text ?? ""))
        
        item = newItemInfo
        
        if let editedItem = item {
            detailDelegate?.didTapDone(editedItem: editedItem)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapAddButton(_ sender: UIButton) {
        detailDelegate?.didTapAddToCart(item: item)
    }
}
//MARK: - Update UI
extension DetailViewController {
    private func configView() {
        updateUI()
        configButton()
        configTextField()
    }
    
    private func configButton() {
        [doneButton, addToCartButton].forEach {
            $0?.setCornerRadius(doneButton.frame.size.height / 2)
        }
    }
    
    private func configTextField() {
        [itemNameTextField, itemPriceTextField].forEach {
            $0?.delegate = self
            $0?.returnKeyType = .done
            $0?.autocorrectionType = .no
        }
        itemNameTextField.autocapitalizationType = .words
    }
    
    private func updateUI() {
        itemImageView.getImageFromURL(item?.imageUrl ?? "")
        itemNameTextField.text = item?.name
        itemPriceTextField.text = String(Double(item?.price ?? 0))
    }
}
//MARK: - Textfield Delegate
extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
