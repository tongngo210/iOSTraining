import UIKit

final class CartViewController: UIViewController {
    @IBOutlet private weak var cartTableView: UITableView!
    @IBOutlet private weak var totalPriceLabel: UILabel!
    @IBOutlet private weak var BuyButton: UIButton!
    
    var itemsInCart = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    @IBAction func didTapBuyButton(_ sender: UIButton) {
        showAlertTwoButton(title: Alert.finishCart.title,
                           message: Alert.finishCart.message,
                           buttonTitle: Alert.buttonTitleYes) { [weak self] _ in
            let paymentStoryboard = Scenes.payment.idStoryboard
            guard let paymentVC = paymentStoryboard.instantiateViewController(withIdentifier: Scenes.payment.idViewController) as? PaymentViewController
            else { return }
            
            self?.navigationController?.pushViewController(paymentVC, animated: true)
        }
    }
}
//MARK: - Update UI
extension CartViewController {
    private func configView() {
        title = Name.cartTitle
        configTableView()
        configButton()
    }
    
    private func configTableView() {
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.rowHeight = cartTableView.frame.size.height / 5
        
        cartTableView.register(UINib(nibName: Name.Nib.cartTableCell, bundle: nil),
                               forCellReuseIdentifier: Name.IdReuseCell.cartTableCell)
    }
    
    private func configButton() {
        BuyButton.layer.cornerRadius = BuyButton.frame.size.height / 6
        BuyButton.isEnabled = false
    }
    
    private func updateUI() {
        let choosenItems = itemsInCart.filter { $0.isChoosen }
                                      .map { $0.price }
        let totalPrice = choosenItems.reduce(0.0) { partialResult, price in
            partialResult + (price ?? 0)
        }
        BuyButton.isEnabled = choosenItems.isEmpty ? false : true
        totalPriceLabel.text = "\(totalPrice) $"
    }
}
//MARK: - TableView Delegate, Data Source
extension CartViewController: UITableViewDelegate,
                              UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return itemsInCart.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Name.IdReuseCell.cartTableCell,
                                                       for: indexPath) as? CartTableCell
        else { return UITableViewCell() }
        
        cell.configView(item: itemsInCart[indexPath.row], indexPath: indexPath)
        cell.cartTableCellDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            self.itemsInCart.remove(at: indexPath.row)
            tableView.reloadData()
            guard let mainVC = self.navigationController?.viewControllers.first as? MainViewController
            else { return }
            mainVC.itemsInCart.remove(at: indexPath.row)
        }
    }
}

//MARK: - CartTableCell Delegate
extension CartViewController: CartTableCellDelegate {
    func didChangeValueChooseSwitch(index: Int, isChoosen: Bool) {
        itemsInCart[index].isChoosen = isChoosen
        updateUI()
    }
}
