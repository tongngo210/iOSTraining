import UIKit

class Spider {
    var name: String?
    var poster: UIImage?
    var icon: UIImage?
    var rate: Int?
    
    init(name: String, poster: UIImage, icon: UIImage, rate: Int) {
        self.name = name
        self.poster = poster
        self.icon = icon
        self.rate = rate
    }
    
    static var spiders: [Spider] {
        return [Spider(name: Name.Spider.tobey, poster: Image.Spider.tobeyLogo, icon: Image.Spider.tobeyIcon, rate: 0),
                Spider(name: Name.Spider.andrew, poster: Image.Spider.andrewLogo, icon: Image.Spider.andrewIcon, rate: 0),
                Spider(name: Name.Spider.tom, poster: Image.Spider.tomLogo, icon: Image.Spider.tomIcon, rate: 0)]
    }
}
