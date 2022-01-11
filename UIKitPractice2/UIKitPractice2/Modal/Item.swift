import Foundation
import UIKit

struct Item {
    var name: String?
    var imageUrl: String?
    var price: Double?
    var isChoosen: Bool
    
    init(name: String? = "", imageUrl: String? = "", price: Double? = 0.0, isChoosen: Bool = false) {
        self.name = name
        self.imageUrl = imageUrl
        self.price = price
        self.isChoosen = isChoosen
    }
}
