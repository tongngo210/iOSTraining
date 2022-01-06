import UIKit

final class PageViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    private let spiders = [Spider(name: Name.Spider.tobey, poster: Image.Spider.tobeyLogo, icon: Image.Spider.tobeyIcon, rate: 0),
                           Spider(name: Name.Spider.andrew, poster: Image.Spider.andrewLogo, icon: Image.Spider.andrewIcon, rate: 0),
                           Spider(name: Name.Spider.tom, poster: Image.Spider.tomLogo, icon: Image.Spider.tomIcon, rate: 0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
}
//MARK: - Update UI
extension PageViewController {
    private func configView() {
        view.backgroundColor = .brown
        configPageControl()
        configScrollView()
    }
    
    private func configPageControl() {
        pageControl.numberOfPages = spiders.count
        pageControl.currentPage = 0
    }
    
    private func configScrollView() {
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: view.frame.size.width * CGFloat(pageControl.numberOfPages),
                                        height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        configPageView()
    }
    
    private func configPageView() {
        for page in 0...pageControl.numberOfPages - 1 {
            let pageView = EasyCustomView(frame: CGRect(x: CGFloat(page) * view.frame.size.width,
                                                        y: 0,
                                                        width: view.frame.size.width,
                                                        height: scrollView.frame.size.height))
            pageView.configView(spider: spiders[page])
            scrollView.addSubview(pageView)
        }
    }
}
//MARK: - ScrollView Delegate
extension PageViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
}
