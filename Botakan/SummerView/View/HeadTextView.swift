import UIKit
import EasyPeasy

class HeadTextView: UIView {
    let mamakLabel: UILabel = {
        let takpakLB = UILabel()
        takpakLB.font = UIFont(name: "Noteworthy-Bold", size: screenWidth / 18.75)
        takpakLB.text = "Мама,"
        takpakLB.textColor = .BlueColor
        return takpakLB
    }()
    let kazLabel: UILabel = {
        let takpakLB = UILabel()
        takpakLB.font = UIFont(name: "Noteworthy-Bold", size: screenWidth / 18.75)
        takpakLB.text = "қазақша сөйлеші!"
        
        takpakLB.textColor = .BlueColor
        return takpakLB
    }()
    let asselSkLabel: UILabel = {
        let takpakLB = UILabel()
        takpakLB.font = UIFont(name: "Noteworthy-Bold", size: screenWidth / 23.437)
        takpakLB.text = "Сапакова Асель"
        takpakLB.textColor = .orangeColor
        return takpakLB
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewsLabel()
        LayoutsLabel()
    }
    
    func setupViewsLabel() {
        [mamakLabel,kazLabel,asselSkLabel].forEach{ addSubview($0) }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func LayoutsLabel(){
        mamakLabel <- [
            Height(screenWidth / 5.8593),
            Width(screenWidth / 5.4347),
            Left(screenWidth / 7.07547),
            Top(0)
        ]
        kazLabel <- [
            Height(screenWidth / 5.8593),
            Width(screenWidth / 2.0833),
            Left(0),
            Top(screenWidth / 12.5)
        ]
        asselSkLabel <- [
            Height(screenWidth / 13.888),
            Width(screenWidth / 2.55),
            Left(screenWidth / 12.5),
            Top(screenWidth / 18.75).to(mamakLabel)
        ]
    }
}



