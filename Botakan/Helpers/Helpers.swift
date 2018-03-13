import UIKit

extension UIColor {
  static let whiteBlueColor = UIColor.init(red: 103/255, green: 198/255, blue: 216/255, alpha: 1.0)
  static let BlueColor = UIColor.init(red: 26/255, green: 58/255, blue: 63/255, alpha: 1.0)
  static let mainBlueColor = UIColor.init(red: 103/255, green: 198/255, blue: 216/255, alpha: 1.0)
  static let bgMusicBtb = UIColor.init(red: 26/255, green: 58/255, blue: 63/255, alpha: 0.7)
  static let bgMusic = UIColor.init(red: 251/255, green: 236/255, blue: 211/255, alpha: 1.0)
  static let sliderMusic = UIColor.init(red: 145/255, green: 216/255, blue: 250/255, alpha: 1.0)
  static let orangeColor = UIColor.init(red: 255/255, green: 106/255, blue: 75/255, alpha: 1.0)
}

class Model{
    static let sharedInstance = Model()
    var sound = false
    var getName = [ParsingJSON]()
}


