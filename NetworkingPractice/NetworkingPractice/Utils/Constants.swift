import Foundation

enum Scenes {
    case detail
    
    var idStoryboard: String {
        switch self {
        case .detail:
            return "Detail"
        }
    }

    var idViewController: String {
        switch self {
        case .detail:
            return "DetailViewController"
        }
    }
}

enum Name {
    static let appTitle = "Dota 2 Heroes"
    static let detailTitle = "Hero Detail"
    
    static let placeholderImage = "cart"
    
    enum Cell {
        static let heroCollectionCell = "HeroCollectionViewCell"
    }
}
