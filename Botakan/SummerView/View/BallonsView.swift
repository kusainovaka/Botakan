
import UIKit
import EasyPeasy

class BallonsView: UIView {
    let ballon1: UIImageView = {
        let imgV = UIImageView(frame: CGRect(x: 86, y: 40, width: 48, height: 80))
        imgV.image = UIImage(named: "parashut_yellow.png")
        return imgV
    }()
    let ballon2: UIImageView = {
        let imgV = UIImageView(frame: CGRect(x: 267, y: 194, width: 59, height: 100))
        imgV.image = UIImage(named: "parashut_pink.png")
        return imgV
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViewsLabel()
        animateBallon()
        LayoutsLabel()
    }
    
    func setupViewsLabel() {
        [ballon1,ballon2].forEach{ addSubview($0) }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func animateBallon(){
        UIView.animate(withDuration: 1.5, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.ballon1.center.y -= 15
        }, completion: nil)
        UIView.animate(withDuration: 1.5, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.ballon2.center.y -= 15
        }, completion: nil)
        
    }
    func LayoutsLabel(){
        ballon1 <- [
            Height(80),
            Width(48),
            Left(8),
            Top(0)
        ]
        ballon2 <- [
            Height(100),
            Width(59),
            Right(2),
            Top(154)
        ]
    }
}
