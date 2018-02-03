import UIKit
import EasyPeasy

class DefaultBGImage: UIView {
    
    let imageView1: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    let imageView2: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [imageView1,imageView2].forEach{ addSubview($0) }
        LayoutsDefault()
    }
    
 func LayoutsDefault(){
        imageView1 <- [
            Width(screenWidth / 4.93),
            Height(screenWidth / 4.93),
            Top(screenWidth / 5.59),
            Left(screenWidth / 7.978)
        ]
        imageView2 <- [
            Width(screenWidth / 4.93),
            Height(screenWidth / 4.93),
            Top(screenWidth / 5.59),
            Left(screenWidth / 1.48)
        ]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


