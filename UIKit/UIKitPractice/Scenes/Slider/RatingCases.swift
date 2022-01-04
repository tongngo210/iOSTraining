import Foundation
import UIKit

enum RatingCases: String, CaseIterable {
    case veryBad = "Very bad"
    case bad = "Bad"
    case normal = "Normal"
    case good = "Good"
    case veryGood = "Very good"
    
    var emojiImage: UIImage {
        switch self {
        case .veryBad:
            return Image.Emoji.veryBadFace ?? UIImage()
        case .bad:
            return Image.Emoji.badFace ?? UIImage()
        case .normal:
            return Image.Emoji.normalFace ?? UIImage()
        case .good:
            return Image.Emoji.goodFace ?? UIImage()
        case .veryGood:
            return Image.Emoji.veryGoodFace ?? UIImage()
        }
    }
    
    init?(rateValue: Int) {
        switch rateValue {
        case 0...20:
            self = .veryBad
        case 21...40:
            self = .bad
        case 41...60:
            self = .normal
        case 61...80:
            self = .good
        case 81...100:
            self = .veryGood
        default:
            return nil
        }
    }
}
