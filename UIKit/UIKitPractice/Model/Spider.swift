import Foundation
import UIKit
class Spider {
    var name: String
    var poster: UIImage
    var icon: UIImage
    var rate: Int
    
    init(name: String, poster: UIImage, icon: UIImage, rate: Int) {
        self.name = name
        self.poster = poster
        self.icon = icon
        self.rate = rate
    }
}
