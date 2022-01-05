import Foundation
import UIKit

enum RatingCases: String, CaseIterable {
    case veryBad = "Very bad"
    case bad = "Bad"
    case normal = "Normal"
    case good = "Good"
    case veryGood = "Very good"
    
    var emojiColor: UIColor {
        switch self {
        case .veryBad:
            return .red
        case .bad:
            return .orange
        case .normal:
            return .yellow
        case .good:
            return .systemGreen
        case .veryGood:
            return .green
        }
    }
    
    var emojiImage: UIImage {
        switch self {
        case .veryBad:
            return Image.Emoji.veryBadFace
        case .bad:
            return Image.Emoji.badFace
        case .normal:
            return Image.Emoji.normalFace
        case .good:
            return Image.Emoji.goodFace
        case .veryGood:
            return Image.Emoji.veryGoodFace
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
