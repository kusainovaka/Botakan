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
            Height(64),
            Width(69),
            Left(53),
            Top(0)
        ]
        kazLabel <- [
            Height(64),
            Width(164),
            Left(0),
            Top(30)
        ]
        asselSkLabel <- [
            Height(27),
            Width(147),
            Left(30),
            Top(20).to(mamakLabel)
        ]
    }
}



