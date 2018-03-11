import UIKit
import EasyPeasy
import SpriteKit

class ProgressBar: UIView {
    
    let imageBack: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "progressTemp")
        return imgV
    }()
    let imageSun: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "sun")
        return imgV
    }()
    let cuteName: UILabel = {
        let takpakLB = UILabel()
        takpakLB.text = "Ласковые слова"
        takpakLB.font = UIFont(name: "Noteworthy-Bold", size: screenWidth / 23.43)
        takpakLB.textColor = .BlueColor
        return takpakLB
    }()
    let cuteWord: UILabel = {
        let takpakLB = UILabel()
        takpakLB.numberOfLines = 2
        takpakLB.font = UIFont(name: "Noteworthy-Bold", size: screenWidth / 23.43)
        takpakLB.textColor = .orangeColor
        return takpakLB
    }()
    let progress : UIProgressView = {
        let temp = UIProgressView(progressViewStyle: .bar)
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 10
        temp.progressTintColor = UIColor.mainBlueColor
        temp.trackTintColor = UIColor.lightGray
        return temp
    }()
    
    let backMenuBTN: UIButton = {
        let backBtn = UIButton()
        backBtn.setImage(#imageLiteral(resourceName: "close"), for: .normal)
        return backBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let array = ["  Құлыншағым \nжеребеночек мой","     Тірегім \nопора моя","  Кішкетайым \nмаленький мой",
           "       Айым \nлуна моя","    Жүрегім \nсердечко мое","      Күнім \nсолнышко моё","   Қошақаным \nягненочек мой","    Шөжегім \nцыпленок мой","     Көжегім \nзайка мой",
           "  Жапалағым \nсовенок мой","   Айналайын \nлюбовь моя","  Балапаным \nптенчик мой","    Шырағым \nсветик мой","      Сәнім \n  краса моя"]
        let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
        cuteWord.text = array[randomIndex]
        backMenuBTN.addTarget(self, action: #selector(returnMenu), for: .touchUpInside)
        setupViewsPRogress()
        LayoutsPgoress()
    }
    func setupViewsPRogress() {
        [imageBack,imageSun,cuteName,cuteWord,progress].forEach{ addSubview($0) }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func returnMenu(){
        print("OKAY GET MENU")
    }
    func LayoutsPgoress(){
        imageBack <- [
        Top(0),
        Left(0),
        Right(0),
        Bottom(0)
        ]
        imageSun <- [
            Left(screenWidth / 4.5),
            Top(screenWidth / 25),
            Height(screenWidth / 7.5),
            Width(screenWidth / 7.5)
        ]
        cuteName <- [
            Left(screenWidth / 8.15),
            Top(screenWidth / 5.35),
            Height(screenWidth / 15),
            Width(screenWidth / 2.5)
        ]
        cuteWord <- [
            Left(screenWidth / 7.5),
            Top(screenWidth / 4.6875),
            Height(screenWidth / 4.6875),
            Width(screenWidth / 2.5)
        ]
        progress <- [
            Left(screenWidth / 11.36),
            Top(screenWidth / 2.42),
            Height(screenWidth / 10.71),
            Width(screenWidth / 2.5)
        ]
//        backMenuBTN <- [
//            Left(screenWidth / 4.032),
//            Top(screenWidth / 1.83),
//            Height(screenWidth / 12.5),
//            Width(screenWidth / 12.5)
//        ]
    }
}

