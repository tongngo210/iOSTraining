import UIKit

final class MainViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    var allItems = [ [Item(name: Name.Shoe.black, imageUrl: URLs.Image.Shoe.black, price: 100),
                      Item(name: Name.Shoe.blue, imageUrl: URLs.Image.Shoe.blue, price: 540),
                      Item(name: Name.Shoe.white, imageUrl: URLs.Image.Shoe.white, price: 200),
                      Item(name: Name.Shoe.brown, imageUrl: URLs.Image.Shoe.brown, price: 325),
                      Item(name: Name.Computer.mac, imageUrl: URLs.Image.Computer.mac, price: 3000),
                      Item(name: Name.Computer.dell, imageUrl: URLs.Image.Computer.dell, price: 1500),
                      Item(name: Name.Computer.asus, imageUrl: URLs.Image.Computer.asus, price: 1800),
                      Item(name: Name.Computer.hp, imageUrl: URLs.Image.Computer.hp, price: 800),
                      Item(name: Name.Cloth.coat, imageUrl: URLs.Image.Cloth.coat, price: 325),
                      Item(name: Name.Cloth.hat, imageUrl: URLs.Image.Cloth.hat, price: 230),
                      Item(name: Name.Cloth.scarf, imageUrl: URLs.Image.Cloth.scarf, price: 50),
                      Item(name: Name.Cloth.shorts, imageUrl: URLs.Image.Cloth.shorts, price: 220),
                      Item(name: Name.Cloth.tshirt, imageUrl: URLs.Image.Cloth.tshirt, price: 40),
                      Item(name: Name.Fruit.grape, imageUrl: URLs.Image.Fruit.grape, price: 70),
                      Item(name: Name.Fruit.lemon, imageUrl: URLs.Image.Fruit.lemon, price: 25),
                      Item(name: Name.Fruit.orange, imageUrl: URLs.Image.Fruit.orange, price: 32),
                      Item(name: Name.Fruit.watermelon, imageUrl: URLs.Image.Fruit.watermelon, price: 60)],
                     [Item(name: Name.Computer.mac, imageUrl: URLs.Image.Computer.mac, price: 3000),
                      Item(name: Name.Computer.dell, imageUrl: URLs.Image.Computer.dell, price: 1500),
                      Item(name: Name.Computer.asus, imageUrl: URLs.Image.Computer.asus, price: 1800),
                      Item(name: Name.Computer.hp, imageUrl: URLs.Image.Computer.hp, price: 800)],
                     [Item(name: Name.Fruit.grape, imageUrl: URLs.Image.Fruit.grape, price: 70),
                      Item(name: Name.Fruit.lemon, imageUrl: URLs.Image.Fruit.lemon, price: 25),
                      Item(name: Name.Fruit.orange, imageUrl: URLs.Image.Fruit.orange, price: 32),
                      Item(name: Name.Fruit.watermelon, imageUrl: URLs.Image.Fruit.watermelon, price: 60)],
                     [Item(name: Name.Cloth.coat, imageUrl: URLs.Image.Cloth.coat, price: 325),
                      Item(name: Name.Cloth.hat, imageUrl: URLs.Image.Cloth.hat, price: 230),
                      Item(name: Name.Cloth.scarf, imageUrl: URLs.Image.Cloth.scarf, price: 50),
                      Item(name: Name.Cloth.shorts, imageUrl: URLs.Image.Cloth.shorts, price: 220),
                      Item(name: Name.Cloth.tshirt, imageUrl: URLs.Image.Cloth.tshirt, price: 40)] ]
    
    var itemsInCart = [Item]()
    
    private var storedOffsets = [Int: CGFloat]()
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
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc private func refresh(_ sender: AnyObject) {
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
                    if item.imageUrl == editedItem.imageUrl {
                        return editedItem
                    }
                    return item
                }
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
        let detailStoryboard = Scenes.detail.idStoryboard
        guard let detailVC = detailStoryboard.instantiateViewController(withIdentifier: Scenes.detail.idViewController) as? DetailViewController
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
        let cartStoryboard = Scenes.cart.idStoryboard
        guard let cartVC = cartStoryboard.instantiateViewController(withIdentifier: Scenes.cart.idViewController) as? CartViewController
        else { return }
        
        cartVC.itemsInCart = itemsInCart
        
        navigationController?.pushViewController(cartVC, animated: true)
    }
}
