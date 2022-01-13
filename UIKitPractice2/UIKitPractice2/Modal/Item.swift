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
    
    static var allItems: [[Item]] {
        return [ [Item(name: Name.Shoe.black, imageUrl: URLs.Image.Shoe.black, price: 100),
                  Item(name: Name.Shoe.blue, imageUrl: URLs.Image.Shoe.blue, price: 540),
                  Item(name: Name.Shoe.white, imageUrl: URLs.Image.Shoe.white, price: 200),
                  Item(name: Name.Shoe.brown, imageUrl: URLs.Image.Shoe.brown, price: 325),
                  Item(name: Name.Computer.mac, imageUrl: URLs.Image.Computer.mac, price: 3000),
                  Item(name: Name.Computer.dell, imageUrl: URLs.Image.Computer.dell, price: 1500),
                  Item(name: Name.Computer.asus, imageUrl: URLs.Image.Computer.asus, price: 1800),
                  Item(name: Name.Computer.hp, imageUrl: URLs.Image.Computer.hp, price: 800),
                  Item(name: Name.Cloth.coat, imageUrl: URLs.Image.Cloth.coat, price: 325),
                  Item(name: Name.Cloth.hat, imageUrl: URLs.Image.Cloth.hat, price: 230),
                  Item(name: Name.Cloth.scarf, imageUrl: URLs.Image.Cloth.scarf, price: 50),
                  Item(name: Name.Cloth.shorts, imageUrl: URLs.Image.Cloth.shorts, price: 220),
                  Item(name: Name.Cloth.tshirt, imageUrl: URLs.Image.Cloth.tshirt, price: 40),
                  Item(name: Name.Fruit.grape, imageUrl: URLs.Image.Fruit.grape, price: 70),
                  Item(name: Name.Fruit.lemon, imageUrl: URLs.Image.Fruit.lemon, price: 25),
                  Item(name: Name.Fruit.orange, imageUrl: URLs.Image.Fruit.orange, price: 32),
                  Item(name: Name.Fruit.watermelon, imageUrl: URLs.Image.Fruit.watermelon, price: 60)],
                 [Item(name: Name.Computer.mac, imageUrl: URLs.Image.Computer.mac, price: 3000),
                  Item(name: Name.Computer.dell, imageUrl: URLs.Image.Computer.dell, price: 1500),
                  Item(name: Name.Computer.asus, imageUrl: URLs.Image.Computer.asus, price: 1800),
                  Item(name: Name.Computer.hp, imageUrl: URLs.Image.Computer.hp, price: 800)],
                 [Item(name: Name.Fruit.grape, imageUrl: URLs.Image.Fruit.grape, price: 70),
                  Item(name: Name.Fruit.lemon, imageUrl: URLs.Image.Fruit.lemon, price: 25),
                  Item(name: Name.Fruit.orange, imageUrl: URLs.Image.Fruit.orange, price: 32),
                  Item(name: Name.Fruit.watermelon, imageUrl: URLs.Image.Fruit.watermelon, price: 60)],
                 [Item(name: Name.Cloth.coat, imageUrl: URLs.Image.Cloth.coat, price: 325),
                  Item(name: Name.Cloth.hat, imageUrl: URLs.Image.Cloth.hat, price: 230),
                  Item(name: Name.Cloth.scarf, imageUrl: URLs.Image.Cloth.scarf, price: 50),
                  Item(name: Name.Cloth.shorts, imageUrl: URLs.Image.Cloth.shorts, price: 220),
                  Item(name: Name.Cloth.tshirt, imageUrl: URLs.Image.Cloth.tshirt, price: 40)] ]
    }
}
