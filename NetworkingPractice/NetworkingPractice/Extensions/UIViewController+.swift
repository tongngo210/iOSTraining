import UIKit

extension UIViewController {
    func showErrorAlert(title: String, message: String,
                        buttonTitle: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle,
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    class func instantiate<T: UIViewController>(storyboard: Scenes) -> T {
        
        let storyboard = UIStoryboard(name: storyboard.idStoryboard, bundle: nil)
        let identifier = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
