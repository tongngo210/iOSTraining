import UIKit

final class PaymentViewController: UIViewController {
    
    @IBOutlet private weak var searchTableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var datePickerView: UIDatePicker!
    @IBOutlet private weak var destinationLabel: UILabel!
    @IBOutlet private weak var dateResultLabel: UILabel!
    @IBOutlet private weak var paymentDoneButton: UIButton!
    
    private let cities = ["Da Nang", "Ha Noi", "Hai Phong", "Ho Chi Minh", "Phu Quoc"]
    private var filteredCities = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    @IBAction func didTapPaymentDoneButton(_ sender: UIButton) {
        showAlertOneButton(title: Alert.finishPayment.title,
                           message: Alert.finishPayment.message,
                           buttonTitle: Alert.buttonTitleOkay) { [weak self] _ in
            guard let mainVC = self?.navigationController?.viewControllers.first as? MainViewController
            else { return }
            mainVC.itemsInCart = []
            self?.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @IBAction func didChangeValueDatePicker(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/MM/dd"
        dateResultLabel.text = dateFormatter.string(from: sender.date)
        updatePaymentDoneButton()
    }
}
//MARK: - Update UI
extension PaymentViewController {
    private func configView() {
        title = Name.PaymentTitle
        filteredCities = cities
        
        configButton()
        configTableView()
        configSearchBar()
    }
    
    private func configTableView() {
        searchTableView.delegate = self
        searchTableView.dataSource = self
    }
    
    private func configButton() {
        paymentDoneButton.layer.cornerRadius = paymentDoneButton.frame.size.height / 2
        paymentDoneButton.isEnabled = false
    }
    
    private func configSearchBar() {
        searchBar.delegate = self
    }
    
    private func updatePaymentDoneButton() {
        if let destinationText = destinationLabel.text,
           let dateResultText = dateResultLabel.text {
            if destinationText.isEmpty || dateResultText.isEmpty {
                paymentDoneButton.isEnabled = false
            } else {
                paymentDoneButton.isEnabled = true
            }
        }
    }
}
//MARK: - TableView Delegate, Datasource
extension PaymentViewController: UITableViewDataSource,
                                 UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return filteredCities.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = filteredCities[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async { [weak self] in
            self?.destinationLabel.text = self?.filteredCities[indexPath.row]
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
//MARK: - Search Bar Delegate
extension PaymentViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredCities = cities
        } else {
            filteredCities = cities.filter {
                $0.lowercased().contains(searchText.lowercased())
            }
        }
        DispatchQueue.main.async { [weak self] in
            self?.searchTableView.reloadData()
            self?.updatePaymentDoneButton()
        }
    }
}
