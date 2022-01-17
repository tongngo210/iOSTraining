import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet private weak var heroesCollectionView: UICollectionView!
    
    var allHeroes: [Hero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        getAllHeroes()
    }
    
    private func getAllHeroes() {
        NetworkManager.shared.allHeroesRequest { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let heroes):
                    self.allHeroes = heroes
                    self.heroesCollectionView.reloadData()
                case .failure(let error):
                    self.showErrorAlert(title: "Bad Stuff Happened",
                                        message: error.rawValue,
                                        buttonTitle: "Got it")
                }
            }
        }
    }
}
//MARK: - Configure UI
extension MainViewController {
    private func configView() {
        title = Name.appTitle
        configCollectionView()
    }
    
    private func configCollectionView() {
        heroesCollectionView.delegate = self
        heroesCollectionView.dataSource = self
        heroesCollectionView.register(UINib(nibName: Name.Cell.heroCollectionCell, bundle: nil),
                                      forCellWithReuseIdentifier: Name.Cell.heroCollectionCell)
    }
}
//MARK: - Collection Delegate, DataSource
extension MainViewController: UICollectionViewDelegate,
                              UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return allHeroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Name.Cell.heroCollectionCell,
                                                            for: indexPath) as? HeroCollectionViewCell
        else { return UICollectionViewCell() }
        
        cell.configCell(hero: allHeroes[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let detailVC: DetailViewController = DetailViewController.instantiate(storyboard: .detail)
        detailVC.heroStats = allHeroes[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
//MARK: - Collection Delegate Flowlayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.size.width / 3 - 10,
                          height: collectionView.frame.size.width / 3)
        return size
    }
}
