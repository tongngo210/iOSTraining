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
        static let tobeyLogo = UIImage(named: "tobeyLogo")
        static let andrewLogo = UIImage(named: "andrewLogo")
        static let tomLogo = UIImage(named: "tomLogo")
    }
    
    enum Emoji {
        static let veryGoodFace = UIImage(named: "face1")
        static let goodFace = UIImage(named: "face2")
        static let normalFace = UIImage(named: "face3")
        static let badFace = UIImage(named: "face4")
        static let veryBadFace = UIImage(named: "face5")
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
    }
}
