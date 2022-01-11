import Foundation
import UIKit

enum Alert {
    static let buttonTitleYes = "Yes"
    static let buttonTitleNo = "No"
    static let buttonTitleOkay = "Okay"
    
    case finishCart
    case finishPayment
    
    var title: String {
        switch self {
        case .finishCart:
            return "Please make sure your items"
        case .finishPayment:
            return "Success"
        }
    }
    
    var message: String {
        switch self {
        case .finishCart:
            return "Are you sure to choose these items?"
        case .finishPayment:
            return "Your order has been successful"
        }
    }
}

enum Scenes {
    case detail
    case cart
    case payment
    
    var idStoryboard: UIStoryboard {
        switch self {
        case .detail:
            return UIStoryboard(name: "Detail", bundle: nil)
        case .cart:
            return UIStoryboard(name: "Cart", bundle: nil)
        case .payment:
            return UIStoryboard(name: "Payment", bundle: nil)
        }
    }

    var idViewController: String {
        switch self {
        case .detail:
            return "DetailViewController"
        case .cart:
            return "CartViewController"
        case .payment:
            return "PaymentViewController"
        }
    }
}

enum Name {
    static let appTitle = "Shopping Center"
    static let cartTitle = "Cart"
    static let PaymentTitle = "Payment"
    
    static let placeholderImageName = "cart"
    
    enum Shoe {
        static let black = "Black Shoes"
        static let blue = "Blue Shoes"
        static let white = "White Shoes"
        static let brown = "Brown Shoes"
    }
    
    enum Cloth {
        static let coat = "Coat"
        static let hat = "Luffy Hat"
        static let scarf = "Scarf"
        static let shorts = "Shorts"
        static let tshirt = "T-Shirt"
    }
    
    enum Computer {
        static let mac = "Macbook 2019"
        static let asus = "Asus"
        static let dell = "Dell"
        static let hp = "Hp"
    }
    
    enum Fruit {
        static let grape = "Grape"
        static let lemon = "Lemon"
        static let orange = "Orange"
        static let watermelon = "Watermelon"
    }
    
    enum Nib {
        static let customCartButton = "CustomCartButton"
        static let mainTableCell = "TableViewCell"
        static let itemCollectionCell = "ItemCollectionCell"
        static let cartTableCell = "CartTableCell"
    }
    
    enum IdReuseCell {
        static let mainTableCell = "MainTableCell"
        static let itemCollectionCell = "MainItemCell"
        static let cartTableCell = "CartTableCell"
    }
}

enum URLs {
    enum Image {
        enum Shoe {
            static let black = "https://m.media-amazon.com/images/I/71R2133PChL._AC_UL320_.jpg"
            static let blue = "https://m.media-amazon.com/images/I/51FjYp-C8QL._SS400_.jpg"
            static let white = "https://m.media-amazon.com/images/I/514uApiJ-yL._UY575_.jpg"
            static let brown = "https://m.media-amazon.com/images/I/817NXl9u6RL._AC_UX395_.jpg"
        }
        
        enum Cloth {
            static let coat = "https://m.media-amazon.com/images/I/81IX39Dsp6L._AC_UX385_.jpg"
            static let hat = "https://m.media-amazon.com/images/I/61+5hBQrXHL._AC_UX385_.jpg"
            static let scarf = "https://m.media-amazon.com/images/I/81xPT2TBSaL._AC_UY445_.jpg"
            static let shorts = "https://m.media-amazon.com/images/I/81r8m9RvLrL._AC_UX385_.jpg"
            static let tshirt = "https://m.media-amazon.com/images/I/71HuLCyNNhL._AC_UL320_.jpg"
        }
        
        enum Computer {
            static let mac = "https://m.media-amazon.com/images/I/71vFKBpKakL._AC_UY218_.jpg"
            static let asus = "https://m.media-amazon.com/images/I/81fstJkUlaL._AC_SY450_.jpg"
            static let dell = "https://m.media-amazon.com/images/I/71taXu6bp8L._AC_SX355_.jpg"
            static let hp = "https://m.media-amazon.com/images/I/717ywJDnAHL._AC_SY450_.jpg"
        }
        
        enum Fruit {
            static let grape = "https://www.fruitsinfo.com/images/fruits-list-large/amazon-tree-grape.jpg"
            static let lemon = "https://m.media-amazon.com/images/I/81p6lBcIx7L._SL1500_.jpg"
            static let orange = "https://m.media-amazon.com/images/I/417n3wrfLgL.jpg"
            static let watermelon = "https://m.media-amazon.com/images/I/511TiYKbuUL._AC_SX425_.jpg"
        }
    }
}
