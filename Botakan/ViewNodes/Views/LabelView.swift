
import UIKit
import EasyPeasy

class LabelView: UIView {
    
    let takpakImageView: UIImageView = {
        let takpakImage = UIImageView()
        takpakImage.image = UIImage(named: "TOP_texy.png")
        return takpakImage
    }()
    
    let takpakLabel: UILabel = {
        let takpakLB = UILabel()
        takpakLB.font = UIFont(name: "Noteworthy-Bold", size: screenWidth / 15.625)
        return takpakLB
    }()
    
    let griliand1: UIImageView = {
        let griliandImage = UIImageView()
        griliandImage.image = UIImage(named: "girlyanda1.png")
        return griliandImage
    }()
    
    let griliand2: UIImageView = {
        let griliandImage = UIImageView()
        griliandImage.image = UIImage(named: "girlyanda2.png")
        return griliandImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewsLabel()
        LayoutsLabel()
    }
    
    func setupViewsLabel() {
        [takpakImageView,takpakLabel,griliand1,griliand2].forEach{ addSubview($0) }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  func LayoutsLabel(){
        takpakImageView <- [
            Left(screenWidth / 7.075),
            Height(screenWidth / 4.16),
            Top(screenWidth / 5),
            Width(screenWidth / 1.388)
        ]
        takpakLabel <- [
            Height(screenWidth / 9.375),
            Width(screenWidth / 1.5),
            Left(screenWidth / 3.5),
            Top(screenWidth / 4.87)
        ]
        griliand1 <- [
            Top(screenHeight / 1.58),
            Width(screenWidth),
            Height(screenWidth / 3.41)
        ]
        griliand2 <- [
            Top(screenWidth / 1.5),
            Width(screenWidth),
            Height(screenWidth / 3.41)
        ]
    }
}

