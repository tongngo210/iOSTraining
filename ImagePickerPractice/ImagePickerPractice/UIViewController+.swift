import Foundation
import UIKit

extension UIViewController {
    func showActionSheet(title: String?,
                         message: String?,
                         alertActions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: .actionSheet)
        
        alertActions.forEach { alert.addAction($0) }
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: nil))
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
}
