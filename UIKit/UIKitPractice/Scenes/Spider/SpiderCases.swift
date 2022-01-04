import Foundation
import UIKit

enum Spider: Int, CaseIterable {
    case tobey = 0, andrew, tom
    
    var name: String {
        switch self {
        case .tobey:
            return Name.Spider.tobey
        case .andrew:
            return Name.Spider.andrew
        case .tom:
            return Name.Spider.tom
        }
    }
    
    var logo: UIImage {
        switch self {
        case .tobey:
            return Image.Spider.tobeyLogo ?? UIImage()
        case .andrew:
            return Image.Spider.andrewLogo ?? UIImage()
        case .tom:
            return Image.Spider.tomLogo ?? UIImage()
        }
    }
}
