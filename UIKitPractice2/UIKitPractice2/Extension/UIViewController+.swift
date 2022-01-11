import Foundation
import UIKit

fileprivate var indicatorView: UIView?

extension UIViewController {
    func showIndicator(seconds: Double) {
        indicatorView = UIView(frame: self.view.bounds)
        indicatorView?.backgroundColor = .gray
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.center = indicatorView?.center ?? CGPoint()
        
        indicatorView?.addSubview(indicator)
        view.addSubview(indicatorView ?? UIView())
        
        view.isUserInteractionEnabled = false
        navigationController?.navigationBar.isHidden = true
        indicator.startAnimating()
        
        Timer.scheduledTimer(withTimeInterval: seconds, repeats: false) { _ in
            indicator.stopAnimating()
            indicatorView?.removeFromSuperview()
            indicatorView = nil
            self.navigationController?.navigationBar.isHidden = false
            self.view.isUserInteractionEnabled = true
        }
    }
    
    func showAlertOneButton(title: String, message: String,
                            buttonTitle: String,
                            didTapButton: @escaping (UIAlertAction?) -> Void) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle,
                                      style: .default,
                                      handler: didTapButton))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertTwoButton(title: String, message: String,
                            buttonTitle: String,
                            didTapButton: @escaping (UIAlertAction?) -> Void) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle,
                                      style: .default,
                                      handler: didTapButton))
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel))
        
        self.present(alert, animated: true, completion: nil)
    }
}
