import Foundation
import UIKit

fileprivate let imageCache = NSCache<AnyObject, UIImage>()

extension UIImageView {
    func getImageFromURL(_ imgURL: String) {
        if let cachedImage = imageCache.object(forKey: imgURL as AnyObject) {
            DispatchQueue.main.async { [weak self] in
                self?.image = cachedImage
            }
            return
        }
        
        self.image = UIImage(systemName: Name.placeholderImageName)
        
        DispatchQueue.global().async { [weak self] in
            if let url = URL(string: imgURL),
               let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                
                DispatchQueue.main.async {
                    imageCache.setObject(image, forKey: imgURL as AnyObject)
                    self?.image = image
                }
            }
        }
        
    }
}
