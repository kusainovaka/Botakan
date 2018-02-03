
import UIKit
import EasyPeasy

class CollectionViewDetails: UIView {
    let imageCV: UIImageView = {
        let imgV = UIImageView()
        return imgV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewsIMG()
        LayoutsIMG()
    }
    func setupViewsIMG() {
        [imageCV].forEach{ addSubview($0) }
   }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
   func LayoutsIMG(){
        imageCV <- [
            Left(screenWidth / 3.2),
            Top(screenWidth / 6.8),
            Height(screenWidth / 7.5),
            Width(screenWidth / 3.95)
        ]
    }
}
