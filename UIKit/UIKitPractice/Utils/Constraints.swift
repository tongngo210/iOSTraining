import Foundation
import UIKit

enum Storyboard {
    case spiderPick
    
    var id: UIStoryboard {
        switch self {
        case .spiderPick:
            return UIStoryboard(name: "SpiderPick", bundle: nil)
        }
    }
}

enum ViewController {
    case spiderPick
    
    var id: String {
        switch self {
        case .spiderPick:
            return "SpiderPickViewController"
        }
    }
}

enum Image {
    enum Spider {
        static let tobeyLogo = UIImage(named: "tobeyLogo") ?? UIImage()
        static let andrewLogo = UIImage(named: "andrewLogo") ?? UIImage()
        static let tomLogo = UIImage(named: "tomLogo") ?? UIImage()
        static let tobeyIcon = UIImage(named: "tobeySpider") ?? UIImage()
        static let andrewIcon = UIImage(named: "andrewSpider") ?? UIImage()
        static let tomIcon = UIImage(named: "tomSpider") ?? UIImage()
    }
    
    enum Emoji {
        static let veryGoodFace = UIImage(named: "face1") ?? UIImage()
        static let goodFace = UIImage(named: "face2") ?? UIImage()
        static let normalFace = UIImage(named: "face3") ?? UIImage()
        static let badFace = UIImage(named: "face4") ?? UIImage()
        static let veryBadFace = UIImage(named: "face5") ?? UIImage()
    }
}

enum Name {
    enum Spider {
        static let tobey = "Tobey Spiderman"
        static let andrew = "Andrew Spiderman"
        static let tom = "Tom Spiderman"
    }
    
    enum NibName {
        static let easyCustomView = "EasyCustomView"
        static let spiderRatingView = "SpiderRatingView"
    }
}
