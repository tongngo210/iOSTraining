import UIKit

final class MainViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var allItems = Item.allItems
    var itemsInCart: [Item] = []
    private var storedOffsets: [Int: CGFloat] = [:]
    
    private let refreshControl = UIRefreshControl()
    private let customView = CustomCartButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customView.updateNumberOfItems(itemsInCart.count)
    }
}
//MARK: - Update UI
extension MainViewController {
    private func configView() {
        title = Name.appTitle
        showIndicator(seconds: 2.5)
        
        configTableView()
        configNavigationBar()
        configRefreshControl()
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = tableView.frame.height / 3
        tableView.register(UINib(nibName: Name.Nib.mainTableCell, bundle: nil),
                           forCellReuseIdentifier: Name.IdReuseCell.mainTableCell)
    }
    
    private func configNavigationBar() {
        guard let navBarHeight = navigationController?.navigationBar.frame.height
        else { return }
        customView.frame = CGRect(x: 0, y: 0,
                                  width: navBarHeight,
                                  height: navBarHeight)
        customView.customCartButtonDelegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: customView)
    }
    
    private func configRefreshControl() {
        refreshControl.addTarget(self,
                                 action: #selector(refreshAllItems),
                                 for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc private func refreshAllItems() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            self?.refreshControl.endRefreshing()
        }
    }
    
    private func updateUI(item: Item?) {
        if let editedItem = item {
            //it should be filtered by ID, but I choose imageUrl
            allItems = allItems.map { items in
                return items.map { item in
                    item.imageUrl == editedItem.imageUrl ? editedItem : item
                }
            }
            itemsInCart = itemsInCart.map { item in
                item.imageUrl == editedItem.imageUrl ? editedItem : item
            }
        }
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}
//MARK: - TableView Delegate, Datasource
extension MainViewController: UITableViewDelegate,
                              UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return allItems.count
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Name.IdReuseCell.mainTableCell,
                                                       for: indexPath) as? TableViewCell
        else { return UITableViewCell() }
        return cell
    }
    //set collection datasource, delegate
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? TableViewCell else { return }
        tableViewCell.setCollection(dataSourceDelegate: self,
                                    forRow: indexPath.section)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.section] ?? 0
    }
    //to keep the position when scrolled of the collection view
    func tableView(_ tableView: UITableView,
                   didEndDisplaying cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? TableViewCell else { return }
        storedOffsets[indexPath.section] = tableViewCell.collectionViewOffset
    }
}
//MARK: - ColletionView Delegate, datasource, flowlayout
extension MainViewController: UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return allItems[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Name.IdReuseCell.itemCollectionCell,
                                                            for: indexPath) as? ItemCollectionCell
        else { return UICollectionViewCell() }
        cell.configView(item: allItems[collectionView.tag][indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width / 2,
                          height: collectionView.frame.height - 16)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let detailStoryboard = UIStoryboard(name: Scenes.detail.idStoryboard, bundle: nil)
        guard let detailVC: DetailViewController = detailStoryboard.instantiateVC()
        else { return }
        
        detailVC.item = allItems[collectionView.tag][indexPath.row]
        
        detailVC.detailDelegate = self
        
        self.navigationController?.present(detailVC, animated: true, completion: nil)
    }
}
//MARK: - Receive data from Detail
extension MainViewController: DetailDelegate {
    func didTapDone(editedItem: Item?) {
        updateUI(item: editedItem)
    }
    
    func didTapAddToCart(item: Item?) {
        if let item = item {
            itemsInCart.append(item)
            DispatchQueue.main.async { [weak self] in
                self?.customView.updateNumberOfItems(self?.itemsInCart.count ?? 0)
            }
        }
    }
}
//MARK: - Push navigation to CartViewController
extension MainViewController: CustomCartButtonDelegate {
    func didTapCartButton() {
        let cartStoryboard = UIStoryboard(name: Scenes.cart.idStoryboard, bundle: nil)
        guard let cartVC: CartViewController = cartStoryboard.instantiateVC()
        else { return }
        cartVC.itemsInCart = itemsInCart
        navigationController?.pushViewController(cartVC, animated: true)
    }
}
