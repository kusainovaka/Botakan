
import UIKit
import EasyPeasy

class TakpakDetail : NSObject{
    
    func takpakDeatilView(){
        labelName.removeFromSuperview()
        CVWW.removeFromSuperview()
        takpakView.isUserInteractionEnabled = true
        detailsView.imageCV.image = UIImage(named: "oky.png")
        swipeToCvTakpak.direction = .right
//        UIView.animate(withDuration: 1.5, delay: 1.0,
//                                   usingSpringWithDamping: 0.1,
//                                   initialSpringVelocity: 0.5,
//                                   options: [], animations: {
//                                    imageFromCv.center.y -= 10
//
//        }, completion: nil)
        
//        UIView.animate(withDuration: 1.0, animations: {
//            imageFromCv.transform = CGAffineTransform(rotationAngle: (15.0 * .pi))
//        })
                UIView.animate(withDuration: 5.0, animations: {
                    imageFromCv.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
//                    imageFromCv.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                })
        UIView.animate(withDuration: 2.0, animations: {
//            imageFromCv.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                                imageFromCv.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        takpakView.addSubview(defaultImage)
        takpakView.addSubview(imageFromCv)
        takpakView.addSubview(imageGirland)
        detailsView.addSubview(takpak)
        detailsView.addSubview(nameTakpak)
        takpakView.addSubview(detailsView)
        takpakView.addSubview(backToCVBtn)
    }
    
}

